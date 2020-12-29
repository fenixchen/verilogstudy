//---------------------------------------------------------------------------

#include <vcl.h>

#include "MainForm.h"
#include "CopyForm.h"
#include "ReplaceConfirmForm.h"
#include "BuildOptionsForm.h"
#include "sysutils.hpp"
#include "TdfParser.h"
#include "ChipDoc.h"
#include "Utils.h"
#include "ChipDebugger.h"
#include "RegRestorer.h"
#include "TableCheckForm.h"
#include "csv.h"
#include "dos.h"
#include "ImportChoice.h"
#include "xlsxio_read.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "RxDBComb"
#pragma link "RxLookup"
#pragma link "DBNavigatorEx"
#pragma link "Placemnt"
#pragma link "RxCombos"
#pragma resource "*.dfm"
TFormTable *FormTable;

#if 0
#define QUICK_DEBUG_MDB "E:\\Software\\TEST\\TEST.MDB"
//#define QUICK_DEBUG_CSV "E:\\Soc\\KVTool\\MDB\\KT6806_OSD_REG\\osd_res_buf_01.csv"
#define QUICK_DEBUG_CSV "E:\\Software\\TEST\\uart0_apb_reg.xlsx"
#define QUICK_DEBUG_TDB "E:\\Software\\TEST\\KT6806_OSD_REG.TDB"
#define QUICK_DEBUG_GEN_HEADER_PATH "E:\\Software\\TEST\\"
#endif

//ChipDebugger cdInstance;
using namespace std;
map<int, int> RegInFilter;
Variant VFilter;

typedef char const * FieldName;
FieldName TABTABLE           = "Tab";
FieldName PAGETABLE          = "Page";
FieldName REGISTERTABLE      = "Register";
FieldName FILTERTABLE        = "Filter";
FieldName REGFILTERMASKTABLE = "RegisterFilterMask";
FieldName REGFIELDTABLE      = "RegisterField";
FieldName ID                 = "ID";
FieldName CAPTION            = "Caption";
FieldName PAGE               = "Page";
FieldName PAGETYPE           = "PageType";
FieldName PAGEREGVAL         = "PageRegVal";
FieldName SHADOWREG          = "ShadowReg";
FieldName SHADOWREGVAL       = "ShadowRegVal";
FieldName SHADOWREGMASK      = "ShadowRegMask";
FieldName INDEXREG           = "IndexReg";
FieldName DATAREG            = "DataReg";
FieldName REGADDRSIZE        = "RegAddressSize";
FieldName REGDATASIZE        = "RegDataSize";
FieldName TAB                = "Tab";
FieldName TAG                = "Tag";
FieldName SLAVEADDR          = "SlaveAddr";
FieldName COLUMN             = "Column";
FieldName ROW                = "Row";
FieldName NAME               = "Name";
FieldName REGISTER           = "Register";
FieldName REGNAME            = "RegName";
FieldName REGADDRESS         = "RegAddress";
FieldName DESCRIPTION        = "Description";
FieldName DEFAULTVAL         = "DefaultVal";
FieldName FLAG               = "Flag";
FieldName FILTER             = "Filter";
FieldName MASK               = "Mask";

FieldName STARTBIT           = "StartBit";
FieldName ENDBIT             = "EndBit";
FieldName REGFIELD           = "RegField";
FieldName FIELDRIGHT         = "FieldRight";




bool inline IsHexDigit(char ch)
{
    return (ch >= '0' && ch <= '9') ||
        (ch >= 'a' && ch <= 'f') ||
        (ch >= 'A' && ch <= 'F');
}
String ReverseCaption(const AnsiString& strCaption)
{
    int len = strCaption.Length();
    if (len < 6) return strCaption;
    if (strCaption[len - 2] == '_' &&
        IsHexDigit(strCaption[len]) &&
        IsHexDigit(strCaption[len-1]))
    {
        String strNewCaption;
        strNewCaption = strCaption.SubString(len - 1, 2) + "_" + strCaption.SubString(1, len - 3);  
        return strNewCaption;
    }
    else
        return strCaption;
}

int ParseSlaveAddresses(AnsiString strSlaveAddrs, TStringList* slSlaveAddrs)
{
    int i = 0;
    slSlaveAddrs->Clear();

    while (1)
    {
        AnsiString str;
        int iPos = strSlaveAddrs.Pos(";");

        if (iPos) str = strSlaveAddrs.SubString(1, iPos - 1);
        else str = strSlaveAddrs;

        if (str.Length() == 0) break;

        slSlaveAddrs->Add(str);
        i++;

        if (!iPos) break;

        strSlaveAddrs = strSlaveAddrs.Delete(1, iPos).Trim();
    }

    return i;
}

//---------------------------------------------------------------------------
__fastcall TFormTable::TFormTable(TComponent* Owner)
        : TForm(Owner)
{
    bInInsert = false;
    ToolBar1->Visible = false;
    dwPageOffset = 8;
    //FormTable->Height = 600;
    for (int i = 0; i < 16; i++)
    {
        TCheckBox * cbBitBox  = new TCheckBox(this);
        cbBitBox->Parent      = tsBit15;
        cbBitBox->Left        = 308 - i * 20;
        cbBitBox->Top         = 28;
        cbBitBox->Width       = 21;
        cbBitBox->Tag         = i;
        cbBitBox->OnClick     = cbBitClick;
        cbBit[i]              = cbBitBox;
        cbBit[i]->Checked     = false;
        TLabel * lblBitBox    = new TLabel(this);
        lblBitBox->Parent     = tsBit15;
        lblBitBox->Caption    = i;
        lblBitBox->Font->Name = "System";
        lblBitBox->Top        = 10;
        lblBitBox->Left       = cbBitBox->Left;
        lblBit[i]             = lblBitBox;
    }

    for (int i = 16; i < 32; i++)
    {
        TCheckBox * cbBitBox  = new TCheckBox(this);
        cbBitBox->Parent      = tsBit31;
        cbBitBox->Left        = 308 - (i - 16) * 20;
        cbBitBox->Top         = 28;
        cbBitBox->Width       = 21;
        cbBitBox->Tag         = i;
        cbBitBox->OnClick     = cbBitClick;
        cbBit[i]              = cbBitBox;
        TLabel * lblBitBox    = new TLabel(this);
        lblBitBox->Parent     = tsBit31;
        lblBitBox->Caption    = i;
        lblBitBox->Font->Name = "System";
        lblBitBox->Top        = 10;
        lblBitBox->Left       = cbBitBox->Left;
        lblBit[i]             = lblBitBox;
    }

    // load plug-ins
    auto_ptr<TIniFile> IniFile(new TIniFile(ExtractFileDir(Application->ExeName) + "\\ChipDebugger.cfg"));
    auto_ptr<TStringList> PageDLLs(new TStringList);
    IniFile->ReadSectionValues("PageType", PageDLLs.get());

    for (int i = 0; i < PageDLLs->Count; i++)
    {
        AnsiString DLL = PageDLLs->Values[AnsiString().sprintf("PageDLL%d", i + 1)];

        if (!DLL.Length())
            break;

        try
        {
            PTPlugin * ptp = new PTPlugin(DLL, 2, 2);
            ptPlugins.push_back(ptp);

            for (int j = 0; j < ptp->piPagePlugin->GetPageObjectCount(); j++)
            {
                IPageObject * pipo = ptp->piPagePlugin->GetPageObject(j);
                //ptp->piPagePlugin->SetChipDebuggerInterface(&cdInstance);
                ipoPageTypes.push_back(pipo);
                dbcbPageType->Items->Add(pipo->GetPageTypeStruct()->strPageTypeCaption);
            }
        }
        catch (Exception& E)
        {
            ShowMessage(E.Message);
        }
    }

    if (ptPlugins.empty())
    {
        Application->MessageBox("Count of page type is zero, please confirm \n"
                                "ChipDebugger.cfg and DefaultPage.dll exist in current directory.",
                                "Information", MB_OK + MB_ICONWARNING);
    }
}
//---------------------------------------------------------------------------

__fastcall TFormTable::~TFormTable()
{
    for (DWORD dw = 0; dw < ptPlugins.size(); dw++)
    {
        delete ptPlugins[dw];
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::btnExitClick(TObject *Sender)
{
    Close();
}

void __fastcall TabBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    if (opt->TabId.find((int)DataSet->FieldValues[ ID ]) == opt->TabId.end()) return;

    Tab * tab = new Tab;
    tab->dwID       = DataSet->FieldValues[ID];
    tab->strCaption = DataSet->FieldValues[CAPTION];
    cd->tvTabs.push_back(tab);
}

void __fastcall PageBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    if (opt->PageId.find((int)DataSet->FieldValues[ ID ]) == opt->PageId.end()) return;

    Page * page = new Page();
    page->dwID                   = DataSet->FieldValues[ID];
    page->psPage.ucPageType      = DataSet->FieldValues[PAGETYPE];
    page->psPage.ucPageData[0]   = DataSet->FieldValues[PAGEREGVAL];
    page->psPage.ucPageData[1]   = DataSet->FieldValues[SHADOWREG];
    page->psPage.ucPageData[2]   = DataSet->FieldValues[SHADOWREGVAL];
    page->psPage.ucPageData[3]   = DataSet->FieldValues[SHADOWREGMASK];
    page->psPage.ucPageData[4]   = DataSet->FieldValues[INDEXREG];
    page->psPage.ucPageData[5]   = DataSet->FieldValues[DATAREG];
    page->psPage.ucRegAddrSize   = DataSet->FieldValues[REGADDRSIZE];
    page->psPage.ucRegDataSize   = DataSet->FieldValues[REGDATASIZE];
    page->psPage.ucSlaveAddr     = DataSet->FieldValues[SLAVEADDR];
    page->psPage.ucTag           = DataSet->FieldValues[TAG];
    page->psPage.ucColumn        = DataSet->FieldValues[COLUMN];
    page->psPage.ucRow           = DataSet->FieldValues[ROW];
    page->strCaption             = DataSet->FieldValues[CAPTION];
    page->strName                = DataSet->FieldValues[NAME];
    page->pTab                   = (Tab*)((DWORD)DataSet->FieldValues[TAB]);
    cd->pvPages.push_back(page);
}

void __fastcall RegisterBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    if (opt->PageId.find((int)DataSet->FieldValues[ PAGE ]) == opt->PageId.end()) return;

    ::Register * reg = new ::Register();
    reg->dwID                    = DataSet->FieldValues[ID];
    reg->strRegName              = DataSet->FieldValues[REGNAME];

    if (!(opt->RegFlagEnabled && DataSet->FieldValues[ FLAG ] > opt->RegFlag))
    {
        reg->strDescription      = DataSet->FieldValues[DESCRIPTION];
    }
    else
    {
        reg->strDescription = "Reserved";
    }

    reg->rsRegister.dwRegAddress = DataSet->FieldValues[REGADDRESS];
    reg->rsRegister.dwRegVal     = DataSet->FieldValues[DEFAULTVAL];
    reg->rsRegister.ucFlag       = DataSet->FieldValues[FLAG];
    reg->pPage                   = (Page*)((DWORD)DataSet->FieldValues[PAGE]);

    for (int i = 0; i < 32; i++)
        reg->rsRegister.arBit[i] = (AccessRight)(int)DataSet->FieldValues[AnsiString("Bit") + i + "Right"];

    cd->rvRegisters.push_back(reg);
}

void __fastcall FilterBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    if (opt->FilterId.find((int)DataSet->FieldValues[ ID ]) == opt->FilterId.end()) return;

    Filter * filter = new Filter();
    filter->dwID       = DataSet->FieldValues[ID];
    filter->strCaption = DataSet->FieldValues[CAPTION];

    cd->fvFilters.push_back(filter);
}

void __fastcall RegFilterMaskBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    if (opt->FilterId.find((int)DataSet->FieldValues[ FILTER ]) == opt->FilterId.end()) return;

    RegFilterMask * rfm = new RegFilterMask;

    rfm->pRegister = (::Register*)((DWORD)DataSet->FieldValues[REGISTER]);
    rfm->pFilter   = (Filter*)((DWORD)DataSet->FieldValues[FILTER]);
    rfm->dwMask    = DataSet->FieldValues[MASK];
    cd->rfmvRegFilterMasks.push_back(rfm);
}


void __fastcall RegFieldBuild(TDataSet * DataSet, ChipData * cd, BuildOptions * opt)
{
    RegField *rf = new RegField;
    rf->pRegister = (::Register*)((DWORD)DataSet->FieldValues[REGISTER]);
    rf->ucStartBit = DataSet->FieldValues[STARTBIT];
    rf->ucEndBit = DataSet->FieldValues[ENDBIT];
    rf->strName = DataSet->FieldValues[NAME];
    rf->strDesc = DataSet->FieldValues[DESCRIPTION];
    rf->dwDefaultVal = DataSet->FieldValues[DEFAULTVAL];
    rf->strRegField = DataSet->FieldValues[REGFIELD];
    cd->rfvRegFields.push_back(rf);
}

typedef void __fastcall(*BuildProc)(TDataSet * DataSet, ChipData * cd, BuildOptions * opt);

struct
{
    char const * strTableName;
    BuildProc Build;
} TablesProc[] =
{
#define TABTABLENO             0
    {TABTABLE,           TabBuild},
#define PAGETABLENO            1
    {PAGETABLE,          PageBuild},
#define REGISTERTABLENO        2
    {REGISTERTABLE,      RegisterBuild},
#define FILTERTABLENO          3
    {FILTERTABLE,        FilterBuild},
#define REGFILTERMASKTABLENO   4
    {REGFILTERMASKTABLE, RegFilterMaskBuild},
#define REGFIELDTABLENO        5
    {REGFIELDTABLE, RegFieldBuild},
};

//---------------------------------------------------------------------------
void __fastcall TFormTable::ConstructChipData(ChipData * cd, int iTableNo, BuildOptions * opt)
{
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + TablesProc[iTableNo].strTableName;

    if (iTableNo == REGISTERTABLENO) // regiser address is ordered
        Query->SQL->Add(AnsiString(" ORDER BY ") + REGADDRESS);
    else if (iTableNo == PAGETABLENO)
        Query->SQL->Add("ORDER BY Caption");
    else if (iTableNo == REGFIELDTABLENO)
        Query->SQL->Text = AnsiString("SELECT RegisterField.* FROM RegisterField, Register "
            "WHERE RegisterField.Register = Register.ID");
            ;    

    Query->Open();
    Query->First();

    int iCount = Query->RecordCount;

    for (int i = 0; i < iCount; i++)
    {
        TablesProc[iTableNo].Build(Query, cd, opt);
        Query->Next();
    }

    Query->Close();
}

void __fastcall TFormTable::btnGenerateClick(TObject *Sender)
{
    CursorSet cs;

    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }

#ifdef QUICK_DEBUG_TDB
    SaveDialog1->FileName = QUICK_DEBUG_TDB;
#else
    SaveDialog1->FileName = ChangeFileExt(strDatabaseName, ".TDB");

    if (!SaveDialog1->Execute())
        return;
#endif

    // user inputs build options
    auto_ptr< TFormBuildOptions > dlg(new TFormBuildOptions(this));

    //if (dlg->ShowModal() == mrCancel) return;

    // get build options
    auto_ptr< BuildOptions > opt(new BuildOptions());
    opt->PageTagEnabled = dlg->rbOnlyTag->Checked;
    opt->PageTagEqual = dlg->cbTagEqual->Items->Strings[dlg->cbTagEqual->ItemIndex];
    opt->PageTag = dlg->edTag->Text.ToInt();

    opt->RegFlagEnabled = dlg->chkRegisterFlag->Checked;
    opt->RegFlag = dlg->cbRegisterFlag->ItemIndex;

    if (opt->RegFlagEnabled == false)
    {
        opt->RegFlag = 0;
        opt->RegFlagEnabled = true;
    }

    // search for included tabs/pages/filters
    // ( e.g. if a filter does not include any registers, it will be removed )
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Add("SELECT ");
    Query->SQL->Add(TABTABLE + AnsiString('.') + ID + AnsiString(','));
    Query->SQL->Add(PAGETABLE + AnsiString('.') + ID + AnsiString(','));
    Query->SQL->Add(REGFILTERMASKTABLE + AnsiString('.') + FILTER);
    Query->SQL->Add(" FROM (((");
    Query->SQL->Add(TABTABLE);
    Query->SQL->Add(" INNER JOIN ");
    Query->SQL->Add(PAGETABLE);
    Query->SQL->Add(" ON " + AnsiString(PAGETABLE) + "." + TAB + "=" + TABTABLE + "." + ID);
    Query->SQL->Add(" ) INNER JOIN ");
    Query->SQL->Add(REGISTERTABLE);
    Query->SQL->Add(" ON " + AnsiString(REGISTERTABLE) + "." + PAGE + "=" + PAGETABLE + "." + ID);
    Query->SQL->Add(" ) LEFT OUTER JOIN ");
    Query->SQL->Add(REGFILTERMASKTABLE);
    Query->SQL->Add(" ON " + AnsiString(REGFILTERMASKTABLE) + "." + REGISTER + "=" + REGISTERTABLE + "." + ID);
    Query->SQL->Add(" ) WHERE 1=1 ");

    if (opt->PageTagEnabled)
    {
        Query->SQL->Add(" AND " + AnsiString(PAGETABLE) + "." + TAG + opt->PageTagEqual + AnsiString(opt->PageTag));
    }

    Query->Open();
    Query->First();

    while (Query->Eof == false)
    {
        opt->TabId.insert(Query->Fields->Fields[ 0 ]->AsInteger);
        opt->PageId.insert(Query->Fields->Fields[ 1 ]->AsInteger);

        if (Query->Fields->Fields[ 2 ]->IsNull == false)
            opt->FilterId.insert(Query->Fields->Fields[ 2 ]->AsInteger);

        Query->Next();
    }

    Query->Close();

    // construct ChipData from database

    auto_ptr<ChipData> cd(new ChipData(0));

    // construct TabTable
    ConstructChipData(cd.get(), TABTABLENO, opt.get());

    // construct PageTable
    ConstructChipData(cd.get(), PAGETABLENO, opt.get());

    // construct RegisterTable
    ConstructChipData(cd.get(), REGISTERTABLENO, opt.get());

    // construct FilterTable
    ConstructChipData(cd.get(), FILTERTABLENO, opt.get());

    // construct RegFilterMaskTable
    ConstructChipData(cd.get(), REGFILTERMASKTABLENO, opt.get());

    // construct RegField
    ConstructChipData(cd.get(), REGFIELDTABLENO, opt.get());

    auto_ptr<TfrmTableCheck> frmTableCheck(new TfrmTableCheck(this));

    if (frmTableCheck->CheckMDB(cd.get()))
    {
        auto_ptr<TFileStream> fs(new TFileStream(SaveDialog1->FileName, fmCreate | fmOpenWrite));
        cd->SaveToStream(fs.get());
        Application->MessageBox(String().sprintf("Generating TDB <%s> done", SaveDialog1->FileName).c_str(), "Information", MB_OK + MB_ICONINFORMATION);
    }
    else
        frmTableCheck->ShowModal();
}
//---------------------------------------------------------------------------
void TFormTable::OpenMDB(const String& strFileName)
{
    btnBackup->Enabled = true;
    AnsiString ConnectionString;
    ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Password=;"
                           "User ID=Admin;Data Source=" + strFileName +
                           ";Mode=Share Deny None;"
                           "Extended Properties=;Jet OLEDB:System database=;"
                           "Jet OLEDB:Registry Path=;"
                           "Jet OLEDB:Database Password=;"
                           "Jet OLEDB:Engine Type=5;"
                           "Jet OLEDB:Database Locking Mode=1;"
                           "Jet OLEDB:Global Partial Bulk Ops=2;"
                           "Jet OLEDB:Global Bulk Transactions=1;"
                           "Jet OLEDB:New Database Password=;"
                           "Jet OLEDB:Create System Database=False;"
                           "Jet OLEDB:Encrypt Database=False;"
                           "Jet OLEDB:Don't Copy Locale on Compact=False;"
                           "Jet OLEDB:Compact Without Replica Repair=False;"
                           "Jet OLEDB:SFP=False";
    ADOConnection1->Close();
    ADOConnection1->ConnectionString = ConnectionString;
    ADOConnection1->Connected = true;
    TabTable->Open();
    PageTable->Open();
    RegisterTable->Open();
    FilterTable->Open();
    RegFilterMaskTable->Open();
    LookupPageTable->Open();
    RegisterFieldTable->Open();

    // update lookup listbox selected item
    llbTab->KeyValue    = TabTable->FieldValues[ID];
    llbPage->KeyValue   = PageTable->FieldValues[ID];
    llbFilter->KeyValue = FilterTable->FieldValues[ID];
    lcbPage->KeyValue   = LookupPageTable->FieldValues[ID];
    
    strDatabaseName = ExtractDatabaseName(strFileName);
    btnAutoGetReadonlyAttr->Enabled = true;
    btnGetDefault->Enabled = true;
    lcbPageClick(NULL);
    //btnCopyFromMDB->Visible = true;
    //GenHeadFile->Visible = true;

    this->Caption =  "Table Editor - " + strFileName;
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnLoadClick(TObject *Sender)
{
#ifdef QUICK_DEBUG_MDB
    OpenMDB(QUICK_DEBUG_MDB);
#else
    if (OpenDialog1->Execute())
    {
        OpenMDB(OpenDialog1->FileName);
    }
#endif    
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::dedPageRegValChange(TObject *Sender)
{
    TDBEdit * edit = dynamic_cast<TDBEdit*>(Sender);
    TField * field = edit->Field;

    if (field)
    {
        field->ValidChars = TFieldChars() << '0' << '1' << '2' << '3' << '4' << '5'
                            << '6' << '7' << '8' << '9' << 'a' << 'b' << 'c' << 'd' << 'e' << 'f'
                            << 'A' << 'B' << 'C' << 'D' << 'E' << 'F' ;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::PageTableAfterPost(TDataSet *DataSet)
{   // refresh look up pages
    PageTable->Refresh();
    LookupPageTable->Close();
    LookupPageTable->Open();

    // because post won't invoke dbcbPageTypeChange, so we have to do it here
    dbcbPageTypeChange(NULL);

    //pcPageType->ActivePageIndex = dbcbPageType->ItemIndex;

    llbPage->KeyValue = PageTable->FieldValues[ID];

    if (llbPage->KeyValue == lcbPage->KeyValue)
        lcbPageClick(lcbPage);  // refresh
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::dbcbPageTypeChange(TObject *Sender)
{
    if (dbcbPageType->ItemIndex == -1) return;

    PageTypeStruct * pts      = ipoPageTypes[dbcbPageType->ItemIndex]->GetPageTypeStruct();

    lblPageRegVal->Caption    = pts->ppsEditor[0].strLabelCaption;
    lblPageRegVal->Visible    = pts->ppsEditor[0].bVisible;
    dedPageRegVal->Visible    = lblPageRegVal->Visible;

    lblShadowReg->Caption     = pts->ppsEditor[1].strLabelCaption;
    lblShadowReg->Visible     = pts->ppsEditor[1].bVisible;
    dedShadowReg->Visible     = lblShadowReg->Visible;

    lblShadowRegVal->Caption  = pts->ppsEditor[2].strLabelCaption;
    lblShadowRegVal->Visible  = pts->ppsEditor[2].bVisible;
    dedShadowRegVal->Visible  = lblShadowRegVal->Visible;

    lblShadowRegMask->Caption = pts->ppsEditor[3].strLabelCaption;
    lblShadowRegMask->Visible = pts->ppsEditor[3].bVisible;
    dedShadowRegMask->Visible = lblShadowRegMask->Visible;

    lblIndexReg->Caption      = pts->ppsEditor[4].strLabelCaption;
    lblIndexReg->Visible      = pts->ppsEditor[4].bVisible;
    dedIndexReg->Visible      = lblIndexReg->Visible;

    lblDataReg->Caption       = pts->ppsEditor[5].strLabelCaption;
    lblDataReg->Visible       = pts->ppsEditor[5].bVisible;
    dedDataReg->Visible       = lblDataReg->Visible;

    lblRegAddrSize->Visible   = pts->bShowRegisterAddressSize;
    dedRegAddrSize->Visible   = lblRegAddrSize->Visible;

    lblRegDataSize->Visible   = pts->bShowRegisterDataSize;
    dedRegDataSize->Visible   = lblRegDataSize->Visible;

    if (PageTable->State == dsEdit || PageTable->State == dsInsert)
    {
        // set default value
        PageTable->FieldValues[PAGEREGVAL]    = pts->psPage.ucPageData[0];
        PageTable->FieldValues[SHADOWREG]     = pts->psPage.ucPageData[1];
        PageTable->FieldValues[SHADOWREGVAL]  = pts->psPage.ucPageData[2];
        PageTable->FieldValues[SHADOWREGMASK] = pts->psPage.ucPageData[3];
        PageTable->FieldValues[INDEXREG]      = pts->psPage.ucPageData[4];
        PageTable->FieldValues[DATAREG]       = pts->psPage.ucPageData[5];
        PageTable->FieldValues[REGADDRSIZE]   = pts->ucDefaultRegAddrSize;
        PageTable->FieldValues[REGDATASIZE]   = pts->ucDefaultRegDataSize;
        PageTable->FieldValues[TAG]           = pts->ucDefaultTag;
        PageTable->FieldValues[SLAVEADDR]     = pts->ucDefaultSlaveAddress;
        PageTable->FieldValues[COLUMN]        = pts->ucDefaultColumn;
        PageTable->FieldValues[ROW]           = pts->ucDefaultRow;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::PageTableAfterScroll(TDataSet *DataSet)
{
    // because scroll won't invoke dbcbPageTypeChange, so we have to do it here
    dbcbPageTypeChange(NULL);
}
//---------------------------------------------------------------------------
DWORD __fastcall TFormTable::GetAddressStep(TDataSet * DataSet)
{
    DWORD PageType    = (DWORD)DataSet->FieldValues[PAGETYPE];
    assert(PageType < ipoPageTypes.size());
    DWORD dwFlag = ipoPageTypes[PageType]->GetFlag();
    if (dwFlag & FLAG_MANNUAL_ADDR_STEP_1)
        return 1;
    else if (dwFlag & FLAG_MANNUAL_ADDR_STEP_2)
        return 2;
    else if (dwFlag & FLAG_MANNUAL_ADDR_STEP_4)
        return 4;
    else
        return (DWORD)DataSet->FieldValues[REGDATASIZE];        
}
//----------------------------------------------------------------------------
DWORD __fastcall TFormTable::GetAddressStart(TDataSet * DataSet)
{
    PageStruct ps;
    ps.ucPageData[0]  = DataSet->FieldValues[PAGEREGVAL];
    ps.ucPageData[1]  = DataSet->FieldValues[SHADOWREG];
    ps.ucPageData[2]  = DataSet->FieldValues[SHADOWREGVAL];
    ps.ucPageData[3]  = DataSet->FieldValues[SHADOWREGMASK];
    ps.ucPageData[4]  = DataSet->FieldValues[INDEXREG];
    ps.ucPageData[5]  = DataSet->FieldValues[DATAREG];
    DWORD PageType    = (DWORD)DataSet->FieldValues[PAGETYPE];
    assert(PageType < ipoPageTypes.size());
    return ipoPageTypes[PageType]->GetStartAddress(ps);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::lcbPageClick(TObject *Sender)
{
    if (lcbPage->KeyValue.IsNull()) return;

    lcbPage2->KeyValue = lcbPage->KeyValue;

    if (Sender == lcbPage)
        lcbPage2Click(NULL);

    int iAddressStart = GetAddressStart(LookupPageTable);

    int RegAddressSize = LookupPageTable->FieldValues[REGADDRSIZE];
    int Size = RegAddressSize;
    int MaxVal = 1;

    while (Size--) MaxVal *= 256 * 16;

    RegisterTableRegAddress->MinValue = iAddressStart;

    if (iAddressStart)
    {
        RegisterTableRegAddress->MaxValue = iAddressStart + 256 * 16;
    }
    else
    {
        if (MaxVal)
            RegisterTableRegAddress->MaxValue = MaxVal - 1;
        else
            RegisterTableRegAddress->MaxValue = 0;
    }

    int RegDataSize = LookupPageTable->FieldValues[REGDATASIZE];
    Size = RegDataSize;

    pcBitAccessRight->Visible = false; // set false here to avoid bis flicking
    lblBitMask->Visible       = true;
    tsBit08->TabVisible       = false;
    tsBit16->TabVisible       = false;
    tsBit24->TabVisible       = false;
    tsBit31->TabVisible       = false;
    pcMask->Visible           = false; // set false here to avoid bis flicking

    for (int i = 8; i < 31; i++)
    {
        cbBit[i]->Visible  = false;
        lblBit[i]->Visible = false;
    }

    switch (Size)
    {
    case 1:
        tsBit15->Caption = "Bit 7 - Bit 0";
        break;
    case 2:
        tsBit15->Caption = "Bit 15 - Bit 0";
        tsBit08->TabVisible = true;

        for (int i = 0; i < 16; i++)
        {
            cbBit[i]->Visible  = true;
            lblBit[i]->Visible = true;
        }

        break;
    case 3:
        tsBit15->Caption = "Bit 15 - Bit 0";
        tsBit31->Caption = "Bit 23 - Bit 16";
        tsBit08->TabVisible = true;
        tsBit16->TabVisible = true;

        for (int i = 0; i < 24; i++)
        {
            cbBit[i]->Visible  = true;
            lblBit[i]->Visible = true;
        }

        tsBit31->TabVisible = true;
        break;
    case 4:
        tsBit15->Caption = "Bit 15 - Bit 0";
        tsBit31->Caption = "Bit 31 - Bit 16";
        tsBit08->TabVisible = true;
        tsBit16->TabVisible = true;
        tsBit24->TabVisible = true;

        for (int i = 0; i < 32; i++)
        {
            cbBit[i]->Visible  = true;
            lblBit[i]->Visible = true;
        }

        tsBit31->TabVisible = true;
        break;
    }

    pcBitAccessRight->Visible = true;
    pcMask->Visible           = true;
    dedDefaultVal->Visible    = true;
    lblDefaultVal->Visible    = true;

    pcBitAccessRight->ActivePageIndex = 0;

    MaxVal = 1;

    while (Size--) MaxVal *= 256;

    if (MaxVal)
        RegisterTableDefaultVal->MaxValue = MaxVal - 1;
    else
        RegisterTableDefaultVal->MaxValue = 0;

    AnsiString Filter = AnsiString(PAGE) + " = " + lcbPage->KeyValue;

    if (RegisterTable->Filter != Filter)
    {
        RegisterTable->Filtered = false;
        RegisterTable->Filter   = Filter;
        RegisterTable->Filtered = true;
    }

    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + REGISTERTABLE + " WHERE " +
                       PAGE + "=" + lcbPage->KeyValue + " ORDER BY " + REGADDRESS;
    Query->Open();
    Query->First();
    int iCount = Query->RecordCount;

    int iColumn = LookupPageTable->FieldValues[COLUMN];
    int iRow    = LookupPageTable->FieldValues[ROW];

    int nStep = GetAddressStep(LookupPageTable);
    InitilizeStringGrid(StringGridReg,  iColumn + 1, iRow + 1, RegAddressSize,
                        iAddressStart, RegDataSize, true, false, nStep);
    InitilizeStringGrid(StringGridReg2, iColumn + 1, iRow + 1, RegAddressSize,
                        iAddressStart, RegDataSize, true, false, nStep);

    for (int i = 0; i < iCount; i++)
    {
        int Address = Query->FieldValues[REGADDRESS] - iAddressStart;
        int DefaultVal = Query->FieldValues[DEFAULTVAL];
        StringGridReg->Cells[Address % iColumn + 1][Address / iColumn + 1] = IntToHex(DefaultVal, 2 * RegDataSize);
        int iID = Query->FieldValues[ID];
        StringGridReg->Objects[Address % iColumn + 1][Address / iColumn + 1] = (TObject*)iID;
        StringGridReg2->Objects[Address % iColumn + 1][Address / iColumn + 1] = (TObject*)iID;

        Query->Next();

    }
    Query->Close();

    Variant v = RegisterTable->FieldValues[REGADDRESS];

    if (!v.IsNull())
    {
        int Address = (int)v - iAddressStart;
        StringGridReg->Col  = Address % iColumn + 1;
        StringGridReg->Row  = Address / iColumn + 1;
        StringGridReg2->Col = Address % iColumn + 1;
        StringGridReg2->Row = Address / iColumn + 1;
    }
    else
    {
        nvRegister->GetButton(nbInsert)->Enabled = true;
        nvRegister->GetButton(nbEdit)->Enabled = false;
//            plRegister->Enabled = false;

        // update
        bool CanSelect;
        StringGridReg2SelectCell(NULL, StringGridReg2->Col, StringGridReg2->Row, CanSelect);
    }

    for (int i = 0; i < StringGridReg->RowCount; i++)  // update stringgridreg2
    {
        StringGridReg2->Rows[i]->Assign(StringGridReg->Rows[i]);
    }

    Query->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableAfterPost(TDataSet *DataSet)
{
    if (!cbAddAll->Checked)
    {
        RegisterTableAfterScroll(DataSet);
        nvRegister->GetButton(nbInsert)->Enabled = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::GetHexText(TField *Sender,
                                       AnsiString &Text, bool DisplayText)
{
    if (!Sender->Value.IsNull())
    {
        int CharCount;
        TIntegerField *f = dynamic_cast<TIntegerField*>(Sender);
        int MaxValue = f->MaxValue;

        if (MaxValue == 0)
            Text = IntToHex(StrToInt(Sender->Value), 1);
        else
        {
            if (MaxValue > 1 && MaxValue <= 255) CharCount = 2;
            else if (MaxValue > 255 && MaxValue <= 65535) CharCount = 4;
            else if (MaxValue > 65535 && MaxValue <= 16777215) CharCount = 6;
            else CharCount = 8;

            Text =  IntToHex(StrToInt(Sender->Value), CharCount);
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::SetHexText(TField *Sender,
                                       const AnsiString Text)
{
    Sender->Value = StrToInt("0x" + Text);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableAfterScroll(TDataSet *DataSet)
{
    // note that LookupPageTable2 and LookupPageSource2 must be created before
    // the RegisterTable and RegisterSource, otherwise the ListField of lcbPage
    // will not be ready when invoke lcbPageClick
    lcbPageClick(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::StringGridRegSelectCell(TObject *Sender,
        int ACol, int ARow, bool &CanSelect)
{
    if (ACol > 0 && ARow > 0)
    {
        if (StringGridReg->Objects[ACol][ARow])
        {
            RegisterTable->Locate(ID, (int)StringGridReg->Objects[ACol][ARow], TLocateOptions());
            nvRegister->GetButton(nbInsert)->Enabled = false;
            nvRegister->GetButton(nbEdit)->Enabled   = true;
            nvRegister->GetButton(nbDelete)->Enabled = true;
        }
        else
        {
            nvRegister->GetButton(nbInsert)->Enabled = true;
            nvRegister->GetButton(nbEdit)->Enabled   = false;
            nvRegister->GetButton(nbDelete)->Enabled = false;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableAfterEdit(TDataSet *DataSet)
{
    nvRegister->GetButton(nbInsert)->Enabled = false;
//    plRegister->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableAfterInsert(TDataSet *DataSet)
{
    if (!bInInsert)
    {
        bInInsert = true;
        RegisterTable->Cancel();    // it seems ADO doesn't support insert, so do append

        int iAddressStart = GetAddressStart(LookupPageTable);
next:
        RegisterTable->Append();
        RegisterTable->FieldValues[PAGE]       = lcbPage->KeyValue;

        RegisterTable->FieldValues[REGADDRESS] =  (StringGridReg->Col - 1) +
                (StringGridReg->Row - 1) * (StringGridReg->ColCount - 1) + iAddressStart;

        RegisterTable->FieldValues[REGNAME]    = "R" + dedRegAddress->Text;
        RegisterTable->FieldValues[DEFAULTVAL] = 0;
        RegisterTable->FieldValues[FLAG]       = 0;

        if (!cbAddAll->Checked)
        {
            for (int i = 0; i < 32; i++)
                RegisterTable->FieldValues[AnsiString("Bit") + i + "Right"]  = 3;
        }

        RegisterTable->Post();
//        plRegister->Enabled = true;

        int iCol = StringGridReg->Col;
        int iRow = StringGridReg->Row;

        while (1)
        {
            iCol++;

            if (iCol >= StringGridReg->ColCount)
            {
                iCol = 1;
                iRow++;

                if (iRow >= StringGridReg->RowCount)
                {
                    bInInsert = false;

                    if (cbAddAll->Checked)
                    {
                        lcbPageClick(NULL); // Refresh
                    }

                    return;
                }
            }

            if (StringGridReg->Cells[iCol][iRow] == "")
            {  // found empty
                StringGridReg->Col = iCol;
                StringGridReg->Row = iRow;

                if (cbAddAll->Checked)
                    goto next;

                bInInsert = false;
                return;
            }
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableAfterCancel(TDataSet *DataSet)
{
    if (StringGridReg->Objects[StringGridReg->Col][StringGridReg->Row])
    {
        nvRegister->GetButton(nbInsert)->Enabled = false;
    }
    else
    {
        nvRegister->GetButton(nbInsert)->Enabled = true;
        nvRegister->GetButton(nbEdit)->Enabled   = false;
        nvRegister->GetButton(nbDelete)->Enabled = false;
    }

//    plRegister->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::PageTableAfterInsert(TDataSet *DataSet)
{
    static bool bInInsert = false;

    if (!bInInsert)
    {
        bInInsert = true;
        PageTable->Cancel();
        PageTable->Append();
        PageTable->FieldValues[TAB]            = llbTab->KeyValue;
        PageTable->FieldValues[PAGETYPE]       = 0;
        PageTable->FieldValues[REGADDRSIZE]    = 1;
        PageTable->FieldValues[REGDATASIZE]    = 1;
        PageTable->FieldValues[PAGEREGVAL]     = 1;
        PageTable->FieldValues[SHADOWREG]      = 255;
        PageTable->FieldValues[SHADOWREGVAL]   = 0;
        PageTable->FieldValues[SHADOWREGMASK]  = 255;
        PageTable->FieldValues[INDEXREG]       = 255;
        PageTable->FieldValues[DATAREG]        = 255;
        PageTable->FieldValues[CAPTION]        = "Page";
        PageTable->FieldValues[TAG]            = 0;
        PageTable->FieldValues[SLAVEADDR]      = 0;
        PageTable->FieldValues[COLUMN]         = 16;
        PageTable->FieldValues[ROW]            = 16;
        bInInsert = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::TabTableAfterScroll(TDataSet *DataSet)
{
    if (!TabTable->FieldValues[ID].IsNull())
    {
        AnsiString Filter = AnsiString(TAB) + " = " + TabTable->FieldValues[ID];

        if (PageTable->Filter != Filter)
        {
            PageTable->Filtered = false;
            PageTable->Filter   = Filter;
            PageTable->Filtered = true;

            if (PageTable->Active)
            {
                llbPage->KeyValue = PageTable->FieldValues[ID];
            }

            /*
                        LookupPageTable->Filtered = false;
                        LookupPageTable->Filter   = Filter;
                        LookupPageTable->Filtered = true;
            */

            if (LookupPageTable->Active)
            {
                lcbPage->KeyValue = LookupPageTable->FieldValues[ID];
                lcbPage2->KeyValue = lcbPage->KeyValue;
                lcbPageClick(lcbPage);
            }
        }

        llbTab->KeyValue = TabTable->FieldValues[ID];
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::TabTableBeforeDelete(TDataSet *DataSet)
{
    Query->Close();
    Query->SQL->Text = AnsiString("DELETE FROM ") + PAGETABLE +
                       " WHERE " + TAB + "=" + AnsiString((int)TabTable->FieldValues[ID]);
    Query->ExecSQL();
    Query->Close();
    /*
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + PAGETABLE + " WHERE " + TAB + "=" + AnsiString((int)TabTable->FieldValues[ID]);
    Query->Open();

    if (Query->RecordCount)
    {
        Query->Close();
        throw(Exception("Please delete pages assositated with this tab first."));
    }
    Query->Close();
    */
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::PageTableBeforeDelete(TDataSet *DataSet)
{
    Query->Close();
    Query->SQL->Text = AnsiString("DELETE FROM ") + REGISTERTABLE +
                       " WHERE " + PAGE + "=" + AnsiString((int)PageTable->FieldValues[ID]);
    Query->ExecSQL();
    Query->Close();
    /*
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + REGISTERTABLE +
        " WHERE " + PAGE + "=" + AnsiString((int)PageTable->FieldValues[ID]);
    Query->Open();

    if (Query->RecordCount)
    {
        Query->Close();
        throw(Exception("Please delete registers assositated with this page first."));
    }
    Query->Close();
    */
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::FilterTableAfterInsert(TDataSet *DataSet)
{
    static bool bInInsert = false;

    if (!bInInsert)
    {
        bInInsert = true;
        FilterTable->Cancel();
        FilterTable->Append();
        FilterTable->FieldValues[CAPTION] = "NewFilter";
        bInInsert = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::FilterTableAfterPost(TDataSet *DataSet)
{
    llbFilter->KeyValue = FilterTable->FieldValues[ID];
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::lcbPage2Click(TObject *Sender)
{
    if (lcbPage2->KeyValue.IsNull()) return;

    lcbPage->KeyValue = lcbPage2->KeyValue;

    if (Sender == lcbPage2)  // if invoked by the UI, then update lcbPage
        lcbPageClick(NULL);  // this will avoid recursive call

}
//---------------------------------------------------------------------------

// strange, Locate and Lookup can not work with filter on, so have to use this way
bool LocateFilteredDataSet(TDataSet * DataSet, const AnsiString KeyField,
                           const int &KeyValues, bool bLocate = true)
{

    if (bLocate)
    {
        /*
                DataSet->First();
                int iRecordCount = DataSet->RecordCount;
                for (int i = 0; i < iRecordCount; i++)
                {
                    if (KeyValues == DataSet->FieldValues[KeyField])
                        break;
                    DataSet->Next();
                }

                return !DataSet->Eof;
        */
        Variant V2(KeyValues);
        int Bounds[2] = {0, 2};
        Variant Key = VarArrayCreate(Bounds, 1, varVariant);
        Key.PutElement(VFilter, 0);
        Key.PutElement(V2, 1);
        return DataSet->Locate("Filter;" + KeyField, Key, TLocateOptions());
    }
    else
    {
        if (RegInFilter.find((int)KeyValues) != RegInFilter.end()) return true;
        else return false;
    }
}

void __fastcall TFormTable::StringGridReg2DrawCell(TObject *Sender,
        int ACol, int ARow, TRect &Rect, TGridDrawState State)
{
    if (!RegFilterMaskTable->Active) return;

    int iRegisterID = (int)StringGridReg2->Objects[ACol][ARow];

    if (iRegisterID)
    {
        if (LocateFilteredDataSet(RegFilterMaskTable, REGISTER, iRegisterID, false))
            iRegisterID = 1;
        else
            iRegisterID = 0;

        // iRegisterID == 1, in the filter
        // iRegisterID == 0, not in the filter
        if (State.Contains(gdSelected))
        {
            if (iRegisterID)
            {   // selected in the filter
                StringGridReg2->Canvas->Brush->Color = clRed;
                StringGridReg2->Canvas->Font->Color = clHighlightText;
            }
            else
            {   // selected not in the filter
                StringGridReg2->Canvas->Brush->Color = clHighlight;
                StringGridReg2->Canvas->Font->Color = clHighlightText;
            }
        }
        else
        {
            if (iRegisterID)
            {   // not selected in the filter
                StringGridReg2->Canvas->Brush->Color = clInfoBk;
                StringGridReg2->Canvas->Font->Color = clRed;
            }
            else
            {   // not selected not in the filter
                StringGridReg2->Canvas->Brush->Color = clInfoBk;
                StringGridReg2->Canvas->Font->Color = clInfoText;
            }
        }

        StringGridReg2->Canvas->TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
                                         StringGridReg2->Cells[ACol][ARow]);
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::StringGridReg2Selected(TGridRect gr)
{
    frRegisters.clear();

    for (int Col = gr.Left; Col <= gr.Right; Col++)
    {
        for (int Row = gr.Top; Row <= gr.Bottom; Row++)
        {
            int iRegisterID = (int)StringGridReg2->Objects[Col][Row];

            if (iRegisterID)
            {
                FilteredRegister fr;
                fr.gc.X = Col;
                fr.gc.Y = Row;
                fr.iRegisterID = iRegisterID;

                if (LocateFilteredDataSet(RegFilterMaskTable, REGISTER, iRegisterID))
                    fr.iMask   = RegFilterMaskTable->FieldValues[MASK];   // in the filter
                else
                    fr.iMask   = 0;        // not in the filter

                frRegisters.push_back(fr);
            }
        }
    }

    if (frRegisters.size() ==  0 || llbFilter->KeyValue.IsNull())
    {   // no selected cells have registers
        bDontCheckBoxClick = true;

        cbInFilter->Checked = false;
        cbInFilter->Enabled = false;

        for (int i = 0; i < 32; i++)
        {
            cbBit[i]->Checked = false;
            cbBit[i]->Enabled = false;
        }

        bDontCheckBoxClick = false;
        return;
    }

    cbInFilter->Enabled = true;
    bool bEnabled = frRegisters.size() != 1;

    bDontCheckBoxClick = true;

    cbInFilter->AllowGrayed = bEnabled;

    for (int i = 0; i < 32; i++)
    {
        cbBit[i]->AllowGrayed = bEnabled;
        cbBit[i]->Enabled = true;
    }

    TCheckBoxState cbsInFilter, cbsBits[32];

    int iSize = 1;

    for (int i = 0; i < (int)frRegisters.size(); i++)
    {
        int iMask = frRegisters[i].iMask;

        if (iSize) // reuse this variable to indicate first time or not
        {   // first time
            cbsInFilter = iMask != 0 ? cbChecked : cbUnchecked;

            for (int i = 0; i < 32; i++)
                cbsBits[i] = (iMask & (1 << i)) ? cbChecked : cbUnchecked;

            iSize = 0;
        }
        else
        {
            if (cbsInFilter != cbGrayed)
            {
                if ((cbsInFilter == cbChecked && iMask == 0) ||
                        (cbsInFilter == cbUnchecked && iMask))
                    cbsInFilter = cbGrayed;
            }

            for (int j = 0; j < 32; j++)
            {
                if (cbsBits[j] != cbGrayed)
                {
                    if (cbsBits[j] == cbChecked && (iMask & (1 << j)) == 0 ||
                            cbsBits[j] == cbUnchecked && (iMask & (1 << j)))
                        cbsBits[j] = cbGrayed;
                }
            }
        }
    }

    cbInFilter->State = cbsInFilter;

    if (cbsInFilter != cbGrayed)
        cbInFilter->AllowGrayed = false;

    for (int i = 0; i < 32; i++)
        cbBit[i]->State = cbsBits[i];

    if (!cbInFilter->Checked)
        for (int i = 0; i < 32; i++)
            cbBit[i]->Enabled = false;

    bDontCheckBoxClick = false;

}

void __fastcall TFormTable::StringGridReg2MouseUp(TObject *Sender,
        TMouseButton Button, TShiftState Shift, int X, int Y)
{
    StringGridReg2Selected(StringGridReg2->Selection);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::FilterTableAfterScroll(TDataSet *DataSet)
{
    if (!FilterTable->FieldValues[ID].IsNull())
    {
        AnsiString Filter = AnsiString(FILTER) + " = " + FilterTable->FieldValues[ID];

        if (RegFilterMaskTable->Filter != Filter)
        {
            VFilter = FilterTable->FieldValues[ID];
            RegInFilter.clear();
            RegFilterMaskTable->Filtered = false;
            RegFilterMaskTable->Filter   = Filter;
            RegFilterMaskTable->Filtered = true;
            bool Active = RegFilterMaskTable->Active;

            if (!Active) RegFilterMaskTable->Open();

            RegFilterMaskTable->First();
            int iRecordCount = RegFilterMaskTable->RecordCount;

            for (int i = 0; i < iRecordCount; i++)
            {
                RegInFilter[(int)RegFilterMaskTable->FieldValues[REGISTER]] = 1;
                RegFilterMaskTable->Next();
            }

            if (!Active) RegFilterMaskTable->Close();

            StringGridReg2->Refresh();
            StringGridReg2Selected(StringGridReg2->Selection);
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::cbInFilterClick(TObject *Sender)
{
    if (bDontCheckBoxClick) return;

    cbInFilter->AllowGrayed = false;

    for (int i = 0; i < 32; i++)
        cbBit[i]->AllowGrayed = false;

    bDontCheckBoxClick = true;

    for (int i = 0; i < 32; i++)
    {
        cbBit[i]->AllowGrayed = false;
        cbBit[i]->Checked     = cbInFilter->Checked;
        cbBit[i]->Enabled     = cbInFilter->Checked;
    }

    bDontCheckBoxClick = false;

    if (cbInFilter->Checked)
    {
        for (int i = 0; i < (int)frRegisters.size(); i++)
        {
            FilteredRegister fr = frRegisters[i];
            frRegisters[i].iMask = -1;

            if (fr.iMask) continue;  // already in the filter, no need to do anything

            RegFilterMaskTable->Insert();
            RegFilterMaskTable->FieldValues[REGISTER] = fr.iRegisterID;
            RegFilterMaskTable->FieldValues[FILTER]   = llbFilter->KeyValue;
            RegFilterMaskTable->FieldValues[MASK]     = -1;
            RegInFilter[fr.iRegisterID] = 1;
            RegFilterMaskTable->Post();

            StringGridReg2->Cells[fr.gc.X][fr.gc.Y] =  StringGridReg2->Cells[fr.gc.X][fr.gc.Y]; // redrew cell
        }
    }
    else
    {
        for (int i = 0; i < (int)frRegisters.size(); i++)
        {
            FilteredRegister fr = frRegisters[i];
            frRegisters[i].iMask = 0;

            if (fr.iMask == 0) continue;  // already not in the filter, no need to do anything

            if (RegFilterMaskTable->FieldValues[REGISTER] == fr.iRegisterID)
            {
                RegInFilter.erase(fr.iRegisterID);
                RegFilterMaskTable->Delete();
            }
            else if (LocateFilteredDataSet(RegFilterMaskTable, REGISTER, fr.iRegisterID))
            {
                RegInFilter.erase(fr.iRegisterID);
                RegFilterMaskTable->Delete();
            }
            else
                ShowMessage("Error while delete this RegFilterMask!");

            StringGridReg2->Cells[fr.gc.X][fr.gc.Y] =  StringGridReg2->Cells[fr.gc.X][fr.gc.Y]; // redrew cell
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::cbBitClick(TObject *Sender)
{
    if (bDontCheckBoxClick) return;

    TCheckBox * cb = dynamic_cast<TCheckBox*>(Sender);

    cb->AllowGrayed = false;

    for (int i = 0; i < (int)frRegisters.size(); i++)
    {
        FilteredRegister fr = frRegisters[i];

        if (fr.iMask)
        {
            fr.iMask &= ~(1 << cb->Tag);

            if (cb->Checked)
                fr.iMask |= (1 << cb->Tag);

            if (!(RegFilterMaskTable->FieldValues[REGISTER] == fr.iRegisterID) &&
                    !LocateFilteredDataSet(RegFilterMaskTable, REGISTER, fr.iRegisterID))
            {
                ShowMessage("Error while edit this RegFilterMask!");
                return;
            }

            RegFilterMaskTable->Edit();
            RegFilterMaskTable->FieldValues[MASK] = fr.iMask;
            RegFilterMaskTable->Post();
            frRegisters[i].iMask = fr.iMask;

            StringGridReg2->Cells[fr.gc.X][fr.gc.Y] =  StringGridReg2->Cells[fr.gc.X][fr.gc.Y]; // redrew cell
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::StringGridReg2SelectCell(TObject *Sender,
        int ACol, int ARow, bool &CanSelect)
{
    TGridRect gr;
    gr.Left   = ACol;
    gr.Top    = ARow;
    gr.Right  = ACol;
    gr.Bottom = ARow;
    StringGridReg2Selected(gr);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableBeforeDelete(TDataSet *DataSet)
{
    Query->Close();
    Query->SQL->Text = AnsiString("DELETE FROM ") + REGFILTERMASKTABLE + " WHERE " + REGISTER + "=" +
                       AnsiString((int)RegisterTable->FieldValues[ID]);
    Query->ExecSQL();
    Query->Close();
    /*
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + REGFILTERMASKTABLE + " WHERE " + REGISTER + "=" +
        AnsiString((int)RegisterTable->FieldValues[ID]);
    Query->Open();
    if (Query->RecordCount)
    {
        Query->Close();
        throw(Exception("Please delete regter-filter-mask assositated with this register first."));
    }
    Query->Close();
    */
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::FilterTableBeforeDelete(TDataSet *DataSet)
{
    Query->Close();
    Query->SQL->Text = AnsiString("DELETE FROM ") + REGFILTERMASKTABLE + " WHERE " + FILTER + "=" +
                       AnsiString((int)FilterTable->FieldValues[ID]);
    Query->ExecSQL();
    Query->Close();
    /*
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + REGFILTERMASKTABLE + " WHERE " + FILTER + "=" +
        AnsiString((int)FilterTable->FieldValues[ID]);
    Query->Open();

    if (Query->RecordCount)
    {
        Query->Close();
        throw(Exception("Please delete register-filter-mask assositated with this filter first."));
    }
    Query->Close();
    */
}
//---------------------------------------------------------------------------
DWORD TFormTable::GetPageAddressStart(const String& strPageName)
{
    auto_ptr< TADOTable > page(new TADOTable(this));
    page->Clone(LookupPageTable, ltReadOnly);
    page->Filter = ID + AnsiString("=") + strPageName;
    page->Filtered = true;

    try
    {
        page->FindFirst();
    }
    catch (...)
    {
    }

    if (page->Found)
    {
        return GetAddressStart(page.get());
    }
    else
        return 0;
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::btnCopyClick(TObject *Sender)
{
    auto_ptr<TFormCopy> FormCopy(new TFormCopy(this));

    if (FormCopy->ShowModal() == mrOk)
    {
        if (FormCopy->llbPage->KeyValue == lcbPage->KeyValue)
        {
            ShowMessage("Can not copy to the same page.");
            return;
        }

        // address range
        int start_addr = ("0x" + FormCopy->edStartAddr->Text).ToInt();
        int end_addr = ("0x" + FormCopy->edEndAddr->Text).ToInt();

        int nSrcStartAddress = GetPageAddressStart((String)FormCopy->llbPage->KeyValue);
        int nDstStartAddress = GetAddressStart(LookupPageTable);

        // source
        auto_ptr< TADOTable > src(new TADOTable(this));
        src->Clone(RegisterTable, ltReadOnly);
        src->Filter = PAGE + AnsiString("=") + (AnsiString)FormCopy->llbPage->KeyValue +
                      " AND " + REGADDRESS + ">=" + AnsiString(start_addr + nSrcStartAddress) +
                      " AND " + REGADDRESS + "<=" + AnsiString(end_addr + nSrcStartAddress);
        src->Filtered = true;

        // destination
        auto_ptr< TADOTable > dest(new TADOTable(this));
        dest->Clone(RegisterTable, ltOptimistic);
        dest->Filtered = true;

        // names of the fields to copy
        auto_ptr< TStringList > fields(new TStringList());
        RegisterTable->GetFieldNames(fields.get());
        fields->Delete(fields->IndexOf(ID));
        fields->Delete(fields->IndexOf(PAGE));
        fields->Delete(fields->IndexOf(REGADDRESS));

        // user choices when duplicated found
        bool overwrite = false;
        bool skip = false;

        // iterate source
        try
        {
            src->FindFirst();
        }
        catch (...)
        {
        }

        while (src->Found)
        {
            int nRegAddress = nDstStartAddress + src->FieldValues[ REGADDRESS ] - nSrcStartAddress;
            // search for duplicated
            dest->Filter = PAGE + AnsiString("=") + (AnsiString)lcbPage->KeyValue + " AND " +
                           REGADDRESS + "=" + IntToStr(nRegAddress);

            try
            {
                dest->FindFirst();
            }
            catch (...)
            {
            }

            if (dest->Found)   // found
            {
                // query for overwriting
                TModalResult mr = mrNone;

                if (!overwrite && !skip)
                {
                    auto_ptr< TFormReplaceConfirm > dlg(new TFormReplaceConfirm(this));
                    AnsiString format = dlg->lbPrompt->Caption;
                    dlg->lbPrompt->Caption = AnsiString::Format(format, ARRAYOFCONST(((int)src->FieldValues[ REGADDRESS ])));
                    mr = dlg->ShowModal();

                    if (mr == mrYesToAll) overwrite = true;
                    else if (mr == mrNoToAll) skip = true;
                }

                if (overwrite || mr == mrYes)   // user chooses to overwrite
                {
                    // delete existing
                    dest->Edit();
                }
                else if (skip || mr == mrNo)   // user chooses to skip
                {
                    src->FindNext();
                    continue; // skip over
                }
            }
            else
            {
                // insert new
                dest->Append();
            }

            dest->FieldValues[ PAGE ] = lcbPage->KeyValue;
            dest->FieldValues[ REGADDRESS ] = nRegAddress;

            for (int i = 0; i < fields->Count; ++i)
            {
                AnsiString name = fields->Strings[ i ];
                dest->FieldValues[ name ] = src->FieldValues[ name ];
            }

            src->FindNext();
        }

        if (dest->Modified)
        {
            dest->Post();
            RegisterTable->Refresh();
            lcbPageClick(this);
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::btnReadOnlyMouseUp(TObject *Sender,
        TMouseButton Button, TShiftState Shift, int X, int Y)
{
    if (Button == mbLeft) popBit->Popup(Mouse->CursorPos.x, Mouse->CursorPos.y);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::bitMenuClick(TObject *Sender)
{
    if (RegisterTable->State != dsEdit || RegisterTable->State != dsInsert)
        RegisterTable->Edit();

    for (int i = 0; i < 32; i++)
    {
        RegisterTable->FieldValues[AnsiString("Bit") + i + "Right"] = dynamic_cast<TMenuItem*>(Sender)->Tag;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::RegisterTableBeforePost(TDataSet *DataSet)
{
    if (DataSet->State == dsEdit)
    {
        auto_ptr< TADOTable > table(new TADOTable(this));
        table->Clone(RegisterTable, ltReadOnly);
        table->Filter = PAGE + AnsiString("=") + (AnsiString)DataSet->FieldValues[ PAGE ] +
                        " AND " + REGADDRESS + "=" + DataSet->FieldValues[ REGADDRESS ];
        table->Filtered = true;
        table->FindFirst();

        while (table->Found)
        {
            if (table->FieldValues[ ID ] != RegisterTable->FieldValues[ ID ])
            {
                throw Exception("The register address already exists in this page.");
            }

            table->FindNext();
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::btnCreateClick(TObject *Sender)
{
#ifdef QUICK_DEBUG_MDB
    SaveDialog2->FileName = QUICK_DEBUG_MDB;
#else
    SaveDialog2->FileName = "";

    if (!SaveDialog2->Execute())
    {
        return;
    }
#endif    
    CopyFile((ExtractFilePath(Application->ExeName) + "Blank.mdb").c_str(),
        SaveDialog2->FileName.c_str(), FALSE);
    strDatabaseName = ExtractDatabaseName(SaveDialog2->FileName);
    btnGetDefault->Enabled = true;
    OpenMDB(SaveDialog2->FileName);
}
//---------------------------------------------------------------------------
AnsiString TFormTable::ExtractDatabaseName(AnsiString strFileName)
{
    AnsiString strName = ExtractFileName(strFileName);
    AnsiString strExt  = ExtractFileExt(strName);

    if (strExt.Length())
    {
        int pos = strName.Pos(strExt);
        strName.SetLength(pos - 1);
    }

    return strName;
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnBackupClick(TObject *Sender)
{
    TimeSeparator = '_';
    DateSeparator = '_';
    CopyFile(OpenDialog1->FileName.c_str(),
             (ExtractFilePath(Application->ExeName) + DateTimeToStr(Now()) + "_" +
              ExtractFileName(OpenDialog1->FileName)).c_str(), FALSE);
}
//---------------------------------------------------------------------------
void __fastcall CopyRecord(TADOTable *src, TADOTable *dest)
{
    dest->Insert();

    for (int i = 0; i < src->Fields->Count; ++i)
    {
        if (src->Fields->Fields[ i ]->FieldName != ID)
        {
            dest->Fields->Fields[ i ]->Value = src->Fields->Fields[ i ]->Value;
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnMergeClick(TObject *Sender)
{
    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }

    OpenDialog1->FileName = ExtractFilePath(Application->ExeName) + "Chipdata.mdb";

    if (OpenDialog1->Execute())
    {
        AnsiString ConnectionString;
        ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Password=;"
                           "User ID=Admin;Data Source=" + OpenDialog1->FileName +
                           ";Mode=Share Deny None;"
                           "Extended Properties=;Jet OLEDB:System database=;"
                           "Jet OLEDB:Registry Path=;"
                           "Jet OLEDB:Database Password=;"
                           "Jet OLEDB:Engine Type=5;"
                           "Jet OLEDB:Database Locking Mode=1;"
                           "Jet OLEDB:Global Partial Bulk Ops=2;"
                           "Jet OLEDB:Global Bulk Transactions=1;"
                           "Jet OLEDB:New Database Password=;"
                           "Jet OLEDB:Create System Database=False;"
                           "Jet OLEDB:Encrypt Database=False;"
                           "Jet OLEDB:Don't Copy Locale on Compact=False;"
                           "Jet OLEDB:Compact Without Replica Repair=False;"
                           "Jet OLEDB:SFP=False";
        ADOConnection2->Close();
        ADOConnection2->ConnectionString = ConnectionString;
    }
    else
        return ;

    ADOConnection2->Connected = true;
    TabTable2->Open();
    PageTable2->Open();
    RegisterTable2->Open();
    FilterTable2->Open();
    RegFilterMaskTable2->Open();

    auto_ptr< TADOTable > registers(new TADOTable(this));
    auto_ptr< TADOTable > pages(new TADOTable(this));
    auto_ptr< TADOTable > tabs(new TADOTable(this));
    auto_ptr< TADOTable > filters(new TADOTable(this));
    auto_ptr< TADOTable > reg_filters(new TADOTable(this));

    registers->Clone(RegisterTable, ltOptimistic);
    pages->Clone(PageTable, ltOptimistic);
    tabs->Clone(TabTable, ltOptimistic);
    filters->Clone(FilterTable, ltOptimistic);
    reg_filters->Clone(RegFilterMaskTable, ltOptimistic);

    // copys all the filters first, and creates ID map for it
    map< int, int > filter_map;
    FilterTable2->First();

    while (FilterTable2->Eof == false)
    {
        CopyRecord(FilterTable2, filters.get());
        filters->Post();
        filter_map[ FilterTable2->FieldValues[ ID ]] = filters->FieldValues[ ID ];
        FilterTable2->Next();
    }

    // iterates all tabs
    TabTable2->First();

    while (TabTable2->Eof == false)
    {
        CopyRecord(TabTable2, tabs.get());
        tabs->Post();
        int tab_id = tabs->FieldValues[ ID ];

        // iterates all pages in this tab
        PageTable2->Filter = AnsiString(TAB) + "=" + TabTable2->FieldValues[ ID ];
        PageTable2->Filtered = true;
        PageTable2->FindFirst();

        while (PageTable2->Found)
        {
            CopyRecord(PageTable2, pages.get());
            pages->FieldValues[ TAB ] = tab_id;
            pages->Post();
            int page_id = pages->FieldValues[ ID ];

            // iterates all registers in this page
            RegisterTable2->Filter = AnsiString(PAGE) + "=" + PageTable2->FieldValues[ ID ];
            RegisterTable2->Filtered = true;
            RegisterTable2->FindFirst();

            while (RegisterTable2->Found)
            {
                CopyRecord(RegisterTable2, registers.get());
                registers->FieldValues[ PAGE ] = page_id;
                registers->Post();
                int register_id = registers->FieldValues[ ID ];

                // iterates all filters for this register
                RegFilterMaskTable2->Filter = AnsiString(REGISTER) + "=" + RegisterTable2->FieldValues[ ID ];
                RegFilterMaskTable2->Filtered = true;
                RegFilterMaskTable2->FindFirst();

                while (RegFilterMaskTable2->Found)
                {
                    CopyRecord(RegFilterMaskTable2, reg_filters.get());
                    reg_filters->FieldValues[ REGISTER ] = register_id;
                    reg_filters->FieldValues[ FILTER ] = filter_map[ RegFilterMaskTable2->FieldValues[ ID ]];
                    reg_filters->Post();

                    RegFilterMaskTable2->FindNext();
                }

                RegisterTable2->FindNext();
            }

            PageTable2->FindNext();
        }

        TabTable2->Next();
    }

    if (tabs->Modified) tabs->Post();

    if (pages->Modified) pages->Post();

    if (registers->Modified) registers->Post();

    if (filters->Modified) filters->Post();

    if (reg_filters->Modified) reg_filters->Post();

    ADOConnection2->Close();
    
    RegisterFieldTable->Close();
    TabTable->Close();
    PageTable->Close();
    RegisterTable->Close();
    FilterTable->Close();
    RegFilterMaskTable->Close();
    LookupPageTable->Close();

    RegisterFieldTable->Open();
    TabTable->Open();
    PageTable->Open();
    RegisterTable->Open();
    FilterTable->Open();
    RegFilterMaskTable->Open();
    LookupPageTable->Open();

    llbTab->KeyValue    = TabTable->FieldValues[ID];
    llbPage->KeyValue   = PageTable->FieldValues[ID];
    llbFilter->KeyValue = FilterTable->FieldValues[ID];
    lcbPage->KeyValue   = LookupPageTable->FieldValues[ID];

    lcbPageClick(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::DBMemo1SelectionChange(TObject *Sender)
{
    char sizebuf[6];

    try
    {
        FUpdating = True;

        BoldButton->Down = DBMemo1->SelAttributes->Style.Contains(fsBold);
        ItalicButton->Down = DBMemo1->SelAttributes->Style.Contains(fsItalic);
        UnderlineButton->Down = DBMemo1->SelAttributes->Style.Contains(fsUnderline);

        BulletsButton->Down = bool(DBMemo1->Paragraph->Numbering);

        FontSize->Text = itoa(DBMemo1->SelAttributes->Size, sizebuf, 10);
        FontName->FontName = DBMemo1->SelAttributes->Name;
        FontColor->ColorValue = DBMemo1->SelAttributes->Color;

        switch ((int)DBMemo1->Paragraph->Alignment)
        {
        case 0:
            LeftAlign->Down   = True;
            break;
        case 1:
            RightAlign->Down  = True;
            break;
        case 2:
            CenterAlign->Down = True;
            break;
        }
    }
    catch (...)
    {
        FUpdating = False;
    }

    FUpdating = False;

    if (RegisterTable->Active)
        RegisterTable->Edit();
}
//---------------------------------------------------------------------------
TTextAttributes *__fastcall TFormTable::CurrText(void)
{
    return DBMemo1->SelAttributes;
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::EditCutClick(TObject* /*Sender*/)
{
    DBMemo1->CutToClipboard();
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::EditCopyClick(TObject* /*Sender*/)
{
    DBMemo1->CopyToClipboard();
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::EditPasteClick(TObject* /*Sender*/)
{
    DBMemo1->PasteFromClipboard();
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::BoldButtonClick(TObject* /*Sender*/)
{
    if (!FUpdating)
    {
        if (BoldButton->Down)
            CurrText()->Style = CurrText()->Style << fsBold;
        else
            CurrText()->Style = CurrText()->Style >> fsBold;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::ItalicButtonClick(TObject* /*Sender*/)
{
    if (!FUpdating)
    {
        if (ItalicButton->Down)
            CurrText()->Style = CurrText()->Style << fsItalic;
        else
            CurrText()->Style = CurrText()->Style >> fsItalic;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::UnderlineButtonClick(TObject* /*Sender*/)
{
    if (!FUpdating)
    {
        if (UnderlineButton->Down)
            CurrText()->Style = CurrText()->Style << fsUnderline;
        else
            CurrText()->Style = CurrText()->Style >> fsUnderline;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::FontSizeChange(TObject* /*Sender*/)
{
    int fontsize = atoi(FontSize->Text.c_str());

    if ((!FUpdating) && (fontsize))
    {
        if (fontsize < 1)
        {
            //ShowMessage(Reconst_SNumberbetween);
            FontSize->Text = 1;
        }
        else if (fontsize > 1638)
        {
            //ShowMessage(Reconst_SNumberbetween);
            FontSize->Text = 1638;
        }

        CurrText()->Size = atoi(FontSize->Text.c_str());

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::AlignClick(TObject* Sender)
{
    if (!FUpdating)
    {
        TControl *oAliBtn = (TControl*)(Sender);
        DBMemo1->Paragraph->Alignment = (TAlignment)oAliBtn->Tag;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//----------------------------------------------------------------------------
void __fastcall TFormTable::BulletsButtonClick(TObject* /*Sender*/)
{
    if (!FUpdating)
    {
        DBMemo1->Paragraph->Numbering = (TNumberingStyle)BulletsButton->Down;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}


//---------------------------------------------------------------------------

void __fastcall TFormTable::FontNameChange(TObject *Sender)
{
    if (!FUpdating)
    {
        CurrText()->Name = FontName->FontName;

        if (RegisterTable->Active)
            RegisterTable->Edit();
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::FontColorChange(TObject *Sender)
{
    if (RegisterTable->Active)
        RegisterTable->Edit();

    if (!FUpdating)
    {
        CurrText()->Color = FontColor->ColorValue;
    }
}



void __fastcall TFormTable::DBMemo1Enter(TObject *Sender)
{
    ToolBar1->Visible = true;
    //FormTable->Height = 626;
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::DBMemo1Exit(TObject *Sender)
{
//    ToolBar1->Visible = false;
//    FormTable->Height = 600;
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnGetDefaultClick(TObject *Sender)
{
    auto_ptr<TOpenDialog> pOpenDlg(new TOpenDialog(this));
    pOpenDlg->Filter = "*.TDF";

    if (pOpenDlg->Execute() != IDOK) return;

    TDefValRestorer defValRestorer(strDatabaseName, Query);
    /*
        TTdfParser parser(&defValRestorer);
        parser.LoadFromFile(pOpenDlg->FileName);
        parser.Execute();
    */
    lcbPageClick(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::btnGenDocClick(TObject *Sender)
{
    CursorSet cs;

    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }

    SaveDialog2->FileName = ChangeFileExt(OpenDialog1->FileName, ".rtf");

    if (!SaveDialog3->Execute()) return;

    TChipDoc doc(RichEdit1);

    try
    {
        doc.Save(SaveDialog3->FileName);
    }
    catch (...)
    {
        throw;
    }

    // user inputs build options
    auto_ptr< TFormBuildOptions > dlg(new TFormBuildOptions(this));

    if (dlg->ShowModal() == mrCancel) return;

    // get build options
    auto_ptr< BuildOptions > opt(new BuildOptions());
    opt->PageTagEnabled = dlg->rbOnlyTag->Checked;
    opt->PageTagEqual = dlg->cbTagEqual->Items->Strings[dlg->cbTagEqual->ItemIndex];
    opt->PageTag = dlg->edTag->Text.ToInt();

    opt->RegFlagEnabled = dlg->chkRegisterFlag->Checked;
    opt->RegFlag = dlg->cbRegisterFlag->ItemIndex;

    if (opt->RegFlagEnabled == false)
    {
        opt->RegFlag = 0;
        opt->RegFlagEnabled = true;
    }

    // search for included tabs/pages/filters
    // ( e.g. if a filter does not include any registers, it will be removed )
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Add("SELECT ");
    Query->SQL->Add(TABTABLE + AnsiString('.') + ID + AnsiString(','));
    Query->SQL->Add(PAGETABLE + AnsiString('.') + ID + AnsiString(','));
    Query->SQL->Add(REGFILTERMASKTABLE + AnsiString('.') + FILTER);
    Query->SQL->Add(" FROM (((");
    Query->SQL->Add(TABTABLE);
    Query->SQL->Add(" INNER JOIN ");
    Query->SQL->Add(PAGETABLE);
    Query->SQL->Add(" ON " + AnsiString(PAGETABLE) + "." + TAB + "=" + TABTABLE + "." + ID);
    Query->SQL->Add(" ) INNER JOIN ");
    Query->SQL->Add(REGISTERTABLE);
    Query->SQL->Add(" ON " + AnsiString(REGISTERTABLE) + "." + PAGE + "=" + PAGETABLE + "." + ID);
    Query->SQL->Add(" ) LEFT OUTER JOIN ");
    Query->SQL->Add(REGFILTERMASKTABLE);
    Query->SQL->Add(" ON " + AnsiString(REGFILTERMASKTABLE) + "." + REGISTER + "=" + REGISTERTABLE + "." + ID);
    Query->SQL->Add(" ) WHERE 1=1 ");

    if (opt->PageTagEnabled)
    {
        Query->SQL->Add(" AND " + AnsiString(PAGETABLE) + "." + TAG + opt->PageTagEqual + AnsiString(opt->PageTag));
    }

    Query->Open();
    Query->First();

    while (Query->Eof == false)
    {
        opt->TabId.insert(Query->Fields->Fields[ 0 ]->AsInteger);
        opt->PageId.insert(Query->Fields->Fields[ 1 ]->AsInteger);

        if (Query->Fields->Fields[ 2 ]->IsNull == false)
            opt->FilterId.insert(Query->Fields->Fields[ 2 ]->AsInteger);

        Query->Next();
    }

    Query->Close();

    // construct ChipData from database

    auto_ptr<ChipData> cd(new ChipData(0));

    // construct TabTable
    ConstructChipData(cd.get(), TABTABLENO, opt.get());

    // construct PageTable
    ConstructChipData(cd.get(), PAGETABLENO, opt.get());

    // construct RegisterTable
    ConstructChipData(cd.get(), REGISTERTABLENO, opt.get());

    // construct FilterTable
    ConstructChipData(cd.get(), FILTERTABLENO, opt.get());

    // construct RegFilterMaskTable
    ConstructChipData(cd.get(), REGFILTERMASKTABLENO, opt.get());

//    auto_ptr<TFileStream> fs(new TFileStream(SaveDialog1->FileName, fmCreate | fmOpenWrite));

//    cd->SaveToStream(fs.get());

    for (DWORD i = 0; i < cd->rvRegisters.size(); i++)
    {
        for (DWORD dw = 0; dw < cd->pvPages.size(); dw++)
        {
            if ((DWORD)cd->rvRegisters[i]->pPage == cd->pvPages[dw]->dwID)
            {
                cd->rvRegisters[i]->pPage = cd->pvPages[dw];
                cd->pvPages[dw]->rvRegisters.push_back(cd->rvRegisters[i]);
                continue;
            }
        }
    }

    doc.Load(cd.get());
    doc.Save(SaveDialog3->FileName);
    ShowMessage("Done!");
}
//---------------------------------------------------------------------------



void __fastcall TFormTable::cbSetRWClick(TObject *Sender)
{
    AnsiString strQuery = AnsiString("SELECT * FROM Register WHERE Page=") + lcbPage->KeyValue;
    strQuery = strQuery + " ORDER BY RegAddress";
    Query->Close();
    Query->SQL->Text = strQuery;
    Query->Open();
    Query->First();

    while (!Query->Eof)
    {
        Query->Edit();

        for (int i = 0; i < 32; i++)
            if (Query->FieldValues[AnsiString("Bit") + i + "Right"] == 1)
                Query->FieldValues[AnsiString("Bit") + i + "Right"] = 3;

        Query->UpdateRecord();
        Query->Next();
    }

    Query->Close();
    RegisterTable->Close();
    RegisterTable->Open();
    lcbPageClick(Sender);
}
//---------------------------------------------------------------------------


void __fastcall TFormTable::btnCopyFromMDBClick(TObject *Sender)
{
    if (!dblklstdblkCopyPage->Visible)
    {
        btnCopyFromMDB->Caption = "Cancel Copy";
        OpenDialog1->FileName = ExtractFilePath(Application->ExeName) + "Chipdata.mdb";

        if (OpenDialog1->Execute())
        {
            btnBackup->Enabled = true;
            AnsiString ConnectionString;
            ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Password=;"
                               "User ID=Admin;Data Source=" + OpenDialog1->FileName +
                               ";Mode=Share Deny None;"
                               "Extended Properties=;Jet OLEDB:System database=;"
                               "Jet OLEDB:Registry Path=;"
                               "Jet OLEDB:Database Password=;"
                               "Jet OLEDB:Engine Type=5;"
                               "Jet OLEDB:Database Locking Mode=1;"
                               "Jet OLEDB:Global Partial Bulk Ops=2;"
                               "Jet OLEDB:Global Bulk Transactions=1;"
                               "Jet OLEDB:New Database Password=;"
                               "Jet OLEDB:Create System Database=False;"
                               "Jet OLEDB:Encrypt Database=False;"
                               "Jet OLEDB:Don't Copy Locale on Compact=False;"
                               "Jet OLEDB:Compact Without Replica Repair=False;"
                               "Jet OLEDB:SFP=False";
            conADOConnection3->Close();
            conADOConnection3->ConnectionString = ConnectionString;
        }
        else
            return ;

        conADOConnection3->Connected = true;
        tblCopyPageTable->Open();
        tblCopyTarget->Open();
        tblCopySource->Open();
        dblklstdblkCopyPage->Visible = true;
        btnCopyPage->Visible = true;
    }
    else
    {
        btnCopyFromMDB->Caption = "Copy from MDB file";
        dblklstdblkCopyPage->Visible = false;
        btnCopyPage->Visible = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::btnCopyPageClick(TObject *Sender)
{
    int iSource, iTarget, iSourceRegAddress, iTargetRegAddress;
    AnsiString str;

    AnsiString Filter = AnsiString(PAGE) + " = " + llbPage->KeyValue;

    if (tblCopyTarget->Filter != Filter)
    {
        tblCopyTarget->Filtered = false;
        tblCopyTarget->Filter   = Filter;
        tblCopyTarget->Filtered = true;
    }

    Filter = AnsiString(PAGE) + " = " + dblklstdblkCopyPage->KeyValue;

    if (tblCopySource->Filter != Filter)
    {
        tblCopySource->Filtered = false;
        tblCopySource->Filter   = Filter;
        tblCopySource->Filtered = true;
    }

    tblCopySource->First();

    for (iSource = 1; iSource <= tblCopySource->RecordCount; iSource ++)
    {
        iSourceRegAddress = tblCopySource->FieldValues["RegAddress"];
        tblCopyTarget->First();

        for (iTarget = 1; iTarget <= tblCopyTarget->RecordCount; iTarget ++)
        {
            iTargetRegAddress = tblCopyTarget->FieldValues["RegAddress"];

            if ((iSourceRegAddress & 0xFF) == (iTargetRegAddress & 0xFF))
            {
                tblCopyTarget->Edit();
                str = tblCopySource->FieldValues["Description"];
                tblCopyTarget->FieldValues["Description"] = str;
                tblCopyTarget->Post();
                break;
            }

            tblCopyTarget->Next();
        }

        tblCopySource->Next();
    }

    RegisterTable->Close();
    RegisterTable->Open();
    lcbPageClick(lcbPage);
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnSetAllClick(TObject *Sender)
{
    if (ShowQuestion("All register flag will be reset to Level0, are you sure?"))
    {
        CursorSet cs;

        if (!TabTable->Active)
        {
            ShowMessage("Open MDB file first!");
            return;
        }

        Query->Close();
        Query->SQL->Text = AnsiString("SELECT * FROM ") + REGISTERTABLE;

        Query->Open();
        Query->First();

        int iCount = Query->RecordCount;

        for (int i = 0; i < iCount; i++)
        {
            Query->Edit();
            Query->FieldValues[FLAG] = 0;
            Query->Next();
        }

        Query->Close();
        ADOConnection1->Connected = false;
        ADOConnection1->Connected = true;
        ADOConnection1->Connected = true;
        RegisterFieldTable->Open();
        TabTable->Open();
        PageTable->Open();
        RegisterTable->Open();
        FilterTable->Open();
        RegFilterMaskTable->Open();
        LookupPageTable->Open();
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormTable::StringGridRegKeyPress(TObject *Sender,
        char &Key)
{
    {
        if (Key == 'R' || Key == 'r' || Key == 'w' || Key == 'W'
                || Key == 'u' || Key == 'U' || Key == 'd' || Key == 'D')
        {
            if (Key == 'R' || Key == 'r')    bitMenuClick(ReadOnly1);
            else if (Key == 'W' || Key == 'w')    bitMenuClick(ReadWrite1);
            else if (Key == 'U' || Key == 'u')    bitMenuClick(NotUsed1);
            else if (Key == 'D' || Key == 'd')
            {
                RegisterTable->DeleteRecords(arCurrent);
            }

            if (StringGridReg->Col == StringGridReg->ColCount - 1)
            {
                StringGridReg->Col = 1;

                if (StringGridReg->Row == StringGridReg->RowCount - 1)
                {
                    StringGridReg->Row = 1;
                }
                else
                    StringGridReg->Row ++;
            }
            else
                StringGridReg->Col ++;

        }
    }

}
//---------------------------------------------------------------------------


void __fastcall TFormTable::btnSetAllWriteClick(TObject *Sender)
{
    AnsiString strQuery = AnsiString("SELECT * FROM Register WHERE Page=") + lcbPage->KeyValue;
    strQuery = strQuery + " ORDER BY RegAddress";
    Query->Close();
    Query->SQL->Text = strQuery;
    Query->Open();
    Query->First();

    while (!Query->Eof)
    {
        Query->Edit();

        for (int i = 0; i < 32; i++)
            Query->FieldValues[AnsiString("Bit") + i + "Right"] = 2;

        Query->UpdateRecord();
        Query->Next();
    }

    Query->Close();
    RegisterTable->Close();
    RegisterTable->Open();
    lcbPageClick(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TFormTable::btnSetAllReadClick(TObject *Sender)
{
    AnsiString strQuery = AnsiString("SELECT * FROM Register WHERE Page=") + lcbPage->KeyValue;
    strQuery = strQuery + " ORDER BY RegAddress";
    Query->Close();
    Query->SQL->Text = strQuery;
    Query->Open();
    Query->First();

    while (!Query->Eof)
    {
        Query->Edit();

        for (int i = 0; i < 32; i++)
            Query->FieldValues[AnsiString("Bit") + i + "Right"] = 1;

        Query->UpdateRecord();
        Query->Next();
    }

    Query->Close();
    RegisterTable->Close();
    RegisterTable->Open();
    lcbPageClick(Sender);
}
//---------------------------------------------------------------------------
void TFormTable::ParseField(void *s, size_t i, void *p)
{
    TFormTable *pFormTable = (TFormTable *)p;
    String str((const char *)s, i);
    pFormTable->AddCSVField(str);
}

void TFormTable::ParseRow(int c, void *p)
{
    TFormTable *pFormTable = (TFormTable *)p;
    pFormTable->AddCSVRow(c);
}
//----------------------------------------------------------------------------
int TFormTable::GetPageID(const String& strPageName, const String& strPageCaption,
    DWORD dwPageAddr, BYTE ucPageRegDataSize, int nTabID)
{
    int PageID = 0;
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Text = AnsiString("SELECT ID FROM ") + PAGETABLE;
    Query->SQL->Add(AnsiString(" WHERE Name='") + strPageName  + "'");
    Query->Open();
    if (!Query->Eof)
    {
        ShowMessage("<WARNING> Duplicate Page:" + strPageName);
        PageID = Query->FieldByName("ID")->AsInteger;
        Query->Close();
        Query->SQL->Text = AnsiString("DELETE FROM ") + REGISTERTABLE +
                       " WHERE " + PAGE + "=" + AnsiString(PageID);
        Query->ExecSQL();
        Query->Close();
        return PageID;
    }
    Query->Close();

    PageTable->Append();
    if (importRegType == IMPORT_REG_SFR)
    {
        PageTable->FieldValues[PAGETYPE]      = 4;  //MCU Reg
        PageTable->FieldValues[SHADOWREG]     = 0;  //SFR Reg
        PageTable->FieldValues[SHADOWREGVAL]  = 0;
        PageTable->FieldValues[SHADOWREGMASK] = 0;
        PageTable->FieldValues[REGADDRSIZE]   = 1;
        PageTable->FieldValues[REGDATASIZE]   = ucPageRegDataSize;
    }
    else
    {
        PageTable->FieldValues[PAGETYPE]      = 0;  //Hid Reg
        PageTable->FieldValues[SHADOWREG]     = (dwPageAddr >> 24) & 0xFF;
        PageTable->FieldValues[SHADOWREGVAL]  = (dwPageAddr >> 16) & 0xFF;
        PageTable->FieldValues[SHADOWREGMASK] = (dwPageAddr >> 8) & 0xFF;
        PageTable->FieldValues[REGADDRSIZE]   = 1;
        PageTable->FieldValues[REGDATASIZE]   = ucPageRegDataSize;
    }
    PageTable->FieldValues[INDEXREG]      = 0;
    PageTable->FieldValues[DATAREG]       = 0;

    PageTable->FieldValues[CAPTION]       = strPageCaption;
    PageTable->FieldValues[NAME]          = strPageName;
    PageTable->FieldValues[TAG]           = 0;
    PageTable->FieldValues[SLAVEADDR]     = 0;
    PageTable->FieldValues[COLUMN]        = 16/ucPageRegDataSize;
    PageTable->FieldValues[ROW]           = 16;
    PageTable->FieldValues[TAB]           = nTabID;
    PageTable->Post();

    //Get updated ID
    Query->Close();
    Query->SQL->Text = AnsiString("SELECT ID FROM ") + PAGETABLE;
    Query->SQL->Add(AnsiString(" WHERE Name='") + strPageName  + "'");
    Query->Open();
    if (!Query->Eof)
    {
        return Query->FieldByName("ID")->AsInteger;
    }
    Query->Close();

    return PageTable->FieldValues[ID];//here is wrong ID, not updated

}

int TFormTable::GetTabID(const String& strTabName)
{
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Text = AnsiString("SELECT ID FROM ") + TABTABLE;
    Query->SQL->Add(AnsiString(" WHERE Caption='") + strTabName  + "'");
    Query->Open();
    if (!Query->Eof)
    {
        return Query->FieldByName("ID")->AsInteger;
    }
    Query->Close();

    TabTable->Append();
    TabTable->FieldValues[CAPTION] = strTabName;
    TabTable->Post();
    return TabTable->FieldValues[ID];
}

int TFormTable::GetLastRegID()
{
    int regID = 0;
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Text = AnsiString("SELECT MAX(ID) AS MaxID FROM ") + REGISTERTABLE;
    Query->Open();
    if (!Query->Eof)
    {
        regID = Query->FieldByName("MaxID")->AsInteger;
    }
    Query->Close();
    return regID;    
}


String ConvertUnicode(const String& str)
{
    bool allAscii = true;
    for (int i = 1; i <= str.Length(); i ++)
    {
        unsigned char ch = (unsigned char)str[i];
        if (ch >= 128)
        {
            allAscii = false;
            break;
        }
    }
    if (allAscii)
    {
        return str;
    }
    String ret;
    for (int i = 1; i <= str.Length(); i ++)
    {
        unsigned char ch = (unsigned char)str[i];
        if (ch < 128)
        {
            ret += (char)ch;
        }
        else
        {
            ret += String().sprintf("\\'%02x", ch);
            ch = (unsigned char)str[++i];
            ret += String().sprintf("\\'%02x", ch);
        }
    }
    return ret;
}
//----------------------------------------------------------------------------
void TFormTable::AddCSVRegister(CSVRegister& csvRegister)
{
    for (vector<CSVRegister>::iterator it = vecCSVRegister.begin(); it != vecCSVRegister.end(); ++it)
    {
        if (it->dwAddr == csvRegister.dwAddr)
        {
            //ShowInformation("Duplicated register 0x" + IntToHex((__int64)csvRegister.dwAddr, 8)
            //    + " in " + strImportFileName + " !, ignore it.");
            return;
        }
    } 
    String strFmtHeader ="{\\rtf1\\ansi\\ansicpg1252\\deff0{\\fonttbl{\\f0\\fnil\\fcharset0 Consolas;}"
                         "{\\f1\\fnil\\fcharset134 MS Sans Serif;}}\r\n"
                         "{\\colortbl ;\\red0\\green0\\blue255;\\red255\\green0\\blue0;\\red0\\green128\\blue0;}\r\n"
                         "\\viewkind4\\uc1\\pard\\cf1\\lang2052\\b\\f0\\fs28 [%s - 0x%08X]\\cf0\\b0\\fs20\r\n"
                         "\\par\r\n";
    String strFmtItem = "\\par \\cf2 [%2d:%2d] \\cf0 %s, default(%X), %s\r\n";
    String strFmtItem2 = "\\par \\cf2 [%2d:%2d] \\cf0 %s, %s\r\n";;
    String strFmtFooter = "\\par \\f1\r\n"
                          "\\par }\r\n";

    csvRegister.strName = csvRegister.vecField[0].strRegField;
    String strComment;
    strComment.sprintf(strFmtHeader.c_str(), csvRegister.vecField[0].strRegField, csvRegister.dwAddr);
    DWORD dwDefaultVal = 0;
    for (vector<CSVRegField>::const_iterator it = csvRegister.vecField.begin();
        it != csvRegister.vecField.end(); ++it)
    {
        const CSVRegField &csvField = *it;
        dwDefaultVal |= csvField.dwDefault << csvField.ucStartBit;
        String strDesc = StringReplace(csvField.strDesc, "\n", "\r\n \\par ", TReplaceFlags() << rfReplaceAll);
        strDesc = StringReplace(strDesc, "         ", "", TReplaceFlags() << rfReplaceAll);
        if (csvField.dwDefault != 0)
            strComment += String().sprintf(strFmtItem.c_str(),
                csvField.ucEndBit,
                csvField.ucStartBit,
                csvField.strName.Length() == 0 ? "NONE" : csvField.strName.c_str(),
                csvField.dwDefault,
                csvField.strRW);
        else
            strComment += String().sprintf(strFmtItem2.c_str(),
                csvField.ucEndBit,
                csvField.ucStartBit,
                csvField.strName.Length() == 0 ? "NONE" : csvField.strName.c_str(),
                csvField.strRW);

        for (int i = csvField.ucStartBit; i <= csvField.ucEndBit; i ++)
        {
            if (csvField.strRW == "RO" || csvField.strRW == "R/O")
                csvRegister.ucRight[i] = 1;
            else
                csvRegister.ucRight[i] = 3;
        }
        if (!strDesc.IsEmpty())
        {
            String descUnicode = ConvertUnicode(strDesc);
            strComment += "\\par \\cf3\\f1" + descUnicode + "\\cf0\\f0\r\n";
        }
    }
    strComment += strFmtFooter;
    csvRegister.dwDefaultVal = dwDefaultVal;
    csvRegister.strComment = strComment;
    vecCSVRegister.push_back(csvRegister);
}

void TFormTable::ImportPage()
{
    int nTabID;
    DWORD dwPageAddr = (DWORD)-1;
    String strPageName = "", strPageCaption = "";
    int nPageID = -1;    
    RegisterTable2->Close();
    RegisterTable2->Connection = PageTable->Connection;
    RegisterTable2->Open();

    for (vector<CSVRegister>::iterator it = vecCSVRegister.begin(); it != vecCSVRegister.end(); ++it)
    {
        const CSVRegister& CSVReg = *it;
        DWORD dwAddr = CSVReg.dwAddr;
        int nTabID = GetTabID(CSVReg.strTabName);
        if (dwPageAddr != (dwAddr & 0xFFFFFF00))
        {
            dwPageAddr = dwAddr & 0xFFFFFF00;
            if (__argc > 1)
            {
                strPageCaption.sprintf("%02X_%s", (dwPageAddr >> 8) & 0xFF, CSVReg.strPageName.UpperCase().c_str());
            }
            else
            {
                strPageCaption.sprintf("%06X_%s", (dwPageAddr >> 8) & 0xFFFFFF, CSVReg.strPageName.UpperCase().c_str());
            }

            strPageName = "_" + strPageCaption + "_";
                        
            nPageID = GetPageID(strPageName, strPageCaption, dwPageAddr, 4, nTabID);    //set PageRegDataSize is always 4
        }
        BYTE ucRegAddr = (BYTE)(dwAddr & 0xFF) / 4;
        RegisterTable2->Append();
        RegisterTable2->FieldValues[PAGE]       = nPageID;
        if (CSVReg.strName.IsEmpty())
            RegisterTable2->FieldValues[REGNAME]    = String("R") + IntToHex(ucRegAddr, 2);
        else
            RegisterTable2->FieldValues[REGNAME]    = CSVReg.strName;
        RegisterTable2->FieldValues[REGADDRESS] = ucRegAddr;
        RegisterTable2->FieldValues[DESCRIPTION]= CSVReg.strComment;
        RegisterTable2->FieldValues[DEFAULTVAL] = CSVReg.dwDefaultVal;
        RegisterTable2->FieldValues[FLAG]       = 0;

		for (int i = 0; i < 32; i ++)
        {
            RegisterTable2->FieldValues[AnsiString("Bit") + i + "Right"] = CSVReg.ucRight[i];
        }
        RegisterTable2->Post();
        int nRegID = GetLastRegID();
        for (vector<CSVRegField>::const_iterator itField = CSVReg.vecField.begin(); itField != CSVReg.vecField.end(); ++ itField)
        {
            const CSVRegField & csvField = *itField;
            BYTE ucFieldRight = 0;
            if ((csvField.strRW == "R/W")||(csvField.strRW == "RW"))
                ucFieldRight = 3;
            else if (csvField.strRW == "R")
                ucFieldRight = 1;
            else if (csvField.strRW == "W")
                ucFieldRight = 2;
            else
                ucFieldRight = 0;            
            RegisterFieldTable->Append();
            RegisterFieldTable->FieldValues[REGISTER] = nRegID;
            RegisterFieldTable->FieldValues[STARTBIT] = csvField.ucStartBit;
            RegisterFieldTable->FieldValues[ENDBIT] = csvField.ucEndBit;
            RegisterFieldTable->FieldValues[NAME] = csvField.strName;
            RegisterFieldTable->FieldValues[REGFIELD] = csvField.strRegField;
            RegisterFieldTable->FieldValues[DESCRIPTION] = csvField.strDesc;
            RegisterFieldTable->FieldValues[DEFAULTVAL] = csvField.dwDefault;
            RegisterFieldTable->FieldValues[FIELDRIGHT] = ucFieldRight; 
            RegisterFieldTable->Post();
        } 
    }
    RegisterTable2->Close();
    RegisterTable2->Connection = ADOConnection2;


    RegisterTable->Close();
    RegisterTable->Open();
}
//----------------------------------------------------------------------------
void TFormTable::DoImport(const AnsiString& strFileName)
{
    bool bCsvFile = ExtractFileExt(strFileName).UpperCase() == ".CSV";

    if (bCsvFile){
        ClearCSVRows();
        strImportFileName = strFileName;
        auto_ptr<TFileStream> fs(new TFileStream(strFileName, fmOpenRead));
        int nSize = fs->Size;
        char *pBuffer = new char[nSize + 1];
        fs->Read(pBuffer, nSize);
        pBuffer[nSize] = '\0';
        for (char *p = pBuffer; *p; p ++)
        {
            if (*p == CSV_TAB)
            {
                *p = CSV_COMMA;
            }
        }
        struct csv_parser p;
        csv_init(&p, 0);    
        csv_parse(&p, pBuffer, nSize, ParseField, ParseRow, this);
        csv_fini(&p, ParseField, ParseRow, this);
        csv_free(&p);
        delete[] pBuffer;

        if (csvRegister.strTabName.Length() > 0)
        {
            AddCSVRegister(csvRegister);
        }

        ImportPage();
    }
    else
    {
        xlsxioreader xlsxioread = xlsxioread_open(strFileName.c_str());
        xlsxioreadersheetlist sheetlist = xlsxioread_sheetlist_open(xlsxioread);
        if (sheetlist == NULL) {
            return;
        }
        while (1){
            const XLSXIOCHAR* sheetname = xlsxioread_sheetlist_next(sheetlist);
            if (sheetname == NULL)
            {
                break;
            }
            ClearCSVRows();
            int row = 0;
            xlsxioreadersheet sheet = xlsxioread_sheet_open(xlsxioread, sheetname, XLSXIOREAD_SKIP_NONE);
            while (xlsxioread_sheet_next_row(sheet)) {
                XLSXIOCHAR* value;
                while ((value = xlsxioread_sheet_next_cell(sheet)) != NULL) {
                    this->AddCSVField(value);
                }
                this->AddCSVRow(row);
                row ++;
            }
            xlsxioread_sheet_close(sheet);

            if (csvRegister.strTabName.Length() > 0)
            {
                AddCSVRegister(csvRegister);
            }
            ImportPage();
        }
        xlsxioread_sheetlist_close(sheetlist);
    }
}
//----------------------------------------------------------------------------
void TFormTable::AddCSVField(const String& strField)
{
    vecCSVFields.push_back(strField);
}
//----------------------------------------------------------------------------
DWORD TFormTable::StrToHex(const AnsiString str)
{
    DWORD dwRet = 0;
    char chStr[15];
    strcpy(chStr, str.UpperCase().c_str());
    for(int i=2;chStr[i];i++)
    {
        if((chStr[i]<='9')&&(chStr[i]>='0'))
            dwRet = (dwRet<<4) + (chStr[i] - '0');
        else if((chStr[i]<='F')&&(chStr[i]>='A'))
            dwRet = (dwRet<<4) + (chStr[i]-'A'+10);
    }
    return dwRet;
}

static bool ExtractRegField(const String& strBits, BYTE *pStartBit, BYTE *pEndBit)
{
    String str = strBits;
    if (str.Length() == 0) return false;
    if (strBits[1] == '[' && strBits[strBits.Length()] == ']')
    {
        str = strBits.SubString(2, strBits.Length() - 2);
    }
    if (str.Length() > 0)
    {
        int pos = str.Pos(':');
        if (pos > 1)
        {
            int startBit = StrToIntDef(str.SubString(1, pos - 1), -1);
            int endBit = StrToIntDef(str.SubString(pos + 1, str.Length() - pos), -1);
            if (startBit >= 0 && startBit <= 255 && endBit >= 0 && endBit <= 255)
            {
                *pStartBit = min(startBit, endBit);
                *pEndBit = max(startBit, endBit);
                return true;
            }             
        }
        else
        {
            int startBit = StrToIntDef(str, -1);
            if (startBit >= 0 && startBit <= 255) 
            {
                *pStartBit = startBit;
                *pEndBit = startBit;
                return true;            
            }
        }
    }
    return false;    
}

static DWORD ConvertRTLNumber(const String& strRTLNumber)
{
    int radix = 10;
    String strNumber = strRTLNumber.UpperCase();

    int pos = strNumber.Pos("'B");
    if (pos != 0)
    {
        radix = 2;
    }
    else
    {
        pos = strNumber.Pos("'O");
        if (pos != 0)
        {
            radix = 8;
        }
        else
        {
            pos = strNumber.Pos("'D");
            if (pos != 0)
            {
                radix = 10;
            }
            else
            {
                pos = strNumber.Pos("'H");
                if (pos != 0)
                {
                    radix = 16;
                }    
            }
        }
    }

    String strNum = strNumber;
    if (pos != 0)
    {
        strNum = strNumber.SubString(pos + 2, strNumber.Length() - pos - 1);
    }
    return strtoul(strNum.c_str(), NULL, radix);
}


String FormatName(const String& Name)
{
    String NewName = StringReplace(Name, " ", "", TReplaceFlags() << rfReplaceAll);
    NewName = StringReplace(NewName, "-", "_", TReplaceFlags() << rfReplaceAll);
    NewName = StringReplace(NewName, "\n", "_", TReplaceFlags() << rfReplaceAll);
    NewName = StringReplace(NewName, "\r", "", TReplaceFlags() << rfReplaceAll);
    int bracket1 = NewName.Pos("[");
    if (bracket1 > 0)
    {
        NewName = NewName.SubString(1, bracket1 - 1);
    }
    return NewName;
}

void TFormTable::AddCSVRow(int row)
{
    switch (this->csvStage)
    {
        case STAGE_INIT:
        {
            if (vecCSVFields.size() > 2 &&
                vecCSVFields[0].Length() > 0 && vecCSVFields[1].Length() > 0)
            {
                strCSVTabName = vecCSVFields[0];
                int baseAddr = StrToIntDef(vecCSVFields[1], -1);
                if (baseAddr < 0){
                    ShowMessage("Error base addr " + vecCSVFields[1]);
                }
                else
                {
                    dwCSVBaseAddr = ((DWORD)baseAddr) << 16;
                    this->csvStage = STAGE_TAB_NAME;
                    if (vecCSVFields[2] == "4K" || vecCSVFields[2] == "4k")
                    {
                        dwPageOffset = 12;
                    }
                    else
                    {
                        dwPageOffset = 8;
                    }
                }
            }
            break;
        }
        case STAGE_TAB_NAME:
        {
            if (vecCSVFields.size() > 2 &&
                vecCSVFields[0].Length() > 0 && vecCSVFields[1].Length() > 0)
            {
                dwCSVBaseAddr += StrToInt(vecCSVFields[1]) << dwPageOffset;
                strCSVPageName = vecCSVFields[0];
                this->csvStage = STAGE_PAGE_NAME;
            }
            break;
        }
        case STAGE_PAGE_NAME:
        {
            if (vecCSVFields.size() > 2 &&
                vecCSVFields[0] == "ADDRESS" && vecCSVFields[1] == "BIT")
            {
                csvStage = STAGE_REG;
            }
            else if (vecCSVFields.size() > 2 &&
                vecCSVFields[0] == "Addr[10:2]" && vecCSVFields[1] == "Offset[16:0]")
            {
                //for OSD registers
                csvStage = STAGE_REG1;
            }
            break;
        }
        case STAGE_REG:
        {
            unsigned int total_len = 0;
            for (vector<String>::iterator it = vecCSVFields.begin(); it != vecCSVFields.end(); ++it)
            {
                total_len = total_len + it->Trim().Length();
            }
            if (total_len == 0)
            {
                break;
            }
            int field0Length = vecCSVFields[0].Length();
            if (field0Length != 0)
            {
                int iAddr = StrToIntDef(vecCSVFields[0], -1);
                if (iAddr >= 0)
                {
                    if (csvRegister.strTabName.Length() > 0)
                    {
                        AddCSVRegister(csvRegister);
                    }
                    csvRegister.strTabName = FormatName(strCSVTabName);
                    csvRegister.strPageName = FormatName(strCSVPageName);
                    csvRegister.dwAddr = dwCSVBaseAddr + iAddr;
                    csvRegister.strPageType = "RW";
                    csvRegister.ucBits = 32;
                    for (int i = 0; i < 32; i ++)
                    {
                        csvRegister.ucRight[i] = 1;
                    }
                    csvRegister.dwDefaultVal = 0;
                    csvRegister.strRW = "RW";
                    csvRegister.strComment = "";
                    csvRegister.vecField.clear();
                }
            }
            if (csvRegister.strTabName.Length() > 0)
            {
                String strBits = vecCSVFields[1];
                CSVRegField csvField;
                if (field0Length > 0 && strBits.Length() == 0)
                {
                    strBits = "[31:0]";
                }
                if (ExtractRegField(strBits, &csvField.ucStartBit, &csvField.ucEndBit))
                {
                    csvField.strName = FormatName(vecCSVFields[2]);
                    if (csvField.strName.Trim().Length() == 0)
                    {
                        csvField.strName = "reserved";
                    }
                    csvField.strRW = vecCSVFields[3];
                    if (csvField.strRW.Length() == 0)
                    {
                        csvField.strRW = "RW";
                    }
                    csvField.dwDefault = ConvertRTLNumber(vecCSVFields[4]);
                    if (vecCSVFields[5].Length() > 0)
                    {
                        String name = FormatName(vecCSVFields[5]);
                        if (name.UpperCase().Pos(csvRegister.strPageName.UpperCase()) > 0)
                        {
                            csvField.strRegField.sprintf("%s_%s",
                                csvRegister.strTabName,
                                name.c_str());
                        }
                        else
                        {
                            csvField.strRegField.sprintf("%s_%s_%s",
                                csvRegister.strTabName,
                                csvRegister.strPageName,
                                name.c_str());                        
                        }
                    }
                    else
                    {
                        if (csvRegister.vecField.size() > 0)
                        {
                            csvField.strRegField = FormatName(csvRegister.vecField[csvRegister.vecField.size() - 1].strRegField);
                        }
                        else
                        {
                            csvField.strRegField.sprintf("%s_%s_%02X",
                                csvRegister.strTabName,
                                csvRegister.strPageName,
                                csvRegister.dwAddr & 0xFF);
                        }
                    }
                    csvField.strDesc = vecCSVFields[6];
                    csvRegister.vecField.push_back(csvField);
                } 
            }
            break;
        }
        case STAGE_REG1:
        {
            unsigned int total_len = 0;
            for (vector<String>::iterator it = vecCSVFields.begin(); it != vecCSVFields.end(); ++it)
            {
                total_len = total_len + it->Trim().Length();
            }
            if (total_len == 0)
            {
                break;
            }        
            int field0Length = vecCSVFields[0].Length();
            int field1Length = vecCSVFields[1].Length();
            if (field0Length > 0 && field1Length > 0)
            {
                strTempName = "";
                strTempNameCount = 0;
                int iAddr = StrToIntDef("0x" + vecCSVFields[1], -1);
                if (iAddr >= 0 && iAddr <= 0x10000)
                {
                    iAddr &= 0xFF;
                    if (csvRegister.strTabName.Length() > 0)
                    {
                        AddCSVRegister(csvRegister);
                    }
                    csvRegister.strTabName = FormatName(strCSVTabName);
                    csvRegister.strPageName = FormatName(strCSVPageName);
                    csvRegister.dwAddr = dwCSVBaseAddr + (BYTE)iAddr;
                    csvRegister.strPageType = "RW";
                    csvRegister.ucBits = 32;
                    for (int i = 0; i < 32; i ++)
                    {
                        csvRegister.ucRight[i] = 1;
                    }
                    csvRegister.dwDefaultVal = 0;
                    csvRegister.strRW = "RW";
                    csvRegister.strComment = "";
                    csvRegister.vecField.clear();
                }
            }
            if (csvRegister.strTabName.Length() > 0)
            {
                CSVRegField csvField;
                String strBits = vecCSVFields[5];
                if (strBits.Length() == 0)
                {
                    strBits = "[31:0]";
                }
                if (ExtractRegField(strBits, &csvField.ucStartBit, &csvField.ucEndBit))
                {
                    csvField.strRegField = String().sprintf("%s_%s_%02X",
                        csvRegister.strTabName,
                        csvRegister.strPageName,
                        csvRegister.dwAddr & 0xFF);
                        
                    csvField.strRW = vecCSVFields[3];
                    if (csvField.strRW.Length() == 0)
                    {
                        csvField.strRW = "R/W";
                    }
                    csvField.dwDefault = ConvertRTLNumber(vecCSVFields[2]);
                    
                    if (vecCSVFields[4].Trim() == "")
                    {
                        csvField.strName = "reserved";
                    }
                    else
                    {
                        csvField.strName = FormatName(vecCSVFields[4]);
                    }
                    csvField.strDesc = vecCSVFields[6];
                    if (vecCSVFields[7].Length() > 0)
                    {
                        csvField.strDesc = csvField.strDesc + "\r\n" + vecCSVFields[7];
                    }
                    csvRegister.vecField.push_back(csvField);
                } 
            }
            break;
        }
    }
    vecCSVFields.clear();
}
//----------------------------------------------------------------------------
void TFormTable::ClearCSVRows()
{
    vecCSVRegister.clear();
    vecCSVFields.clear();
    csvStage = STAGE_INIT;
    strCSVTabName = "";
    strCSVPageName = "";
    dwCSVBaseAddr = 0;
    csvRegister.strTabName = "";
}
//----------------------------------------------------------------------------
#if 0
void __fastcall TFormTable::GenHeadFileClick(TObject *Sender)
{
    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }
#ifdef  QUICK_DEBUG_GEN_HEADER_PATH
    AnsiString Dir = QUICK_DEBUG_GEN_HEADER_PATH;
#else
    AnsiString Dir = OpenDialog1->FileName;
    if (!SelectDirectory(Dir, TSelectDirOpts() << sdAllowCreate << sdPerformCreate << sdPrompt,0))
    {
        return;
    }
#endif    

    TStringList *sl = new TStringList();
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + PAGETABLE + " ORDER BY ID";
    Query->Open();
    String str, strTmp;
    TStringList *slIncludesAll = new TStringList();

    slIncludesAll->Add("/* Generate by TableEditor, do not edit. */\r\n\r\n");
    slIncludesAll->Add(str.sprintf("#ifndef _HS_REGS_%s_H_", strDatabaseName.UpperCase()));
    slIncludesAll->Add(str.sprintf("#define _HS_REGS_%s_H_\r\n", strDatabaseName.UpperCase()));


    TStringList *slFieldNames = new TStringList();
    while (!Query->Eof)
    {
        DWORD dwPageAddr = 0;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREG] << 24;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREGVAL] << 16;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREGMASK] << 8;
        slFieldNames->Clear();
        DWORD dwPageID = Query->FieldValues[ID];
        String strPageName = Query->FieldValues["Caption"];
        strPageName = strPageName.SubString(4, strPageName.Length() - 3);

        String strPageDefine = String().sprintf("HS_PAGE_%s_%s", strDatabaseName.UpperCase(), strPageName.UpperCase());
        
        sl->Add("/* Generate by TableEditor, do not edit. */\r\n\r\n");
        sl->Add(str.sprintf("#ifndef _%s_H_", strPageDefine));
        sl->Add(str.sprintf("#define _%s_H_\r\n", strPageDefine));

        strTmp = "HS_" + strPageName + "_BASE_ADDRRESS";
        sl->Add(str.sprintf("#define %-64s 0x%08X", strTmp, dwPageAddr));

        Query2->Close();
        Query2->SQL->Text = "SELECT RegName, RegAddress, StartBit, EndBit, RegisterField.Name as FieldName FROM Register, RegisterField";
        Query2->SQL->Add("WHERE Register.ID = RegisterField.Register AND Register.Page = " + IntToStr(dwPageID));
        Query2->SQL->Add("ORDER BY Register.ID, StartBit");
        Query2->Open();
        String strRegNamePrev = "";
        while (!Query2->Eof)
        {
            String strRegName = Query2->FieldByName("RegName")->AsString.UpperCase();
            String strFieldName = Query2->FieldByName("FieldName")->AsString.UpperCase();
            if (strFieldName.SubString(1,9) ==  "RESERVED")
            {
                Query2->Next();
                continue;
            }
                        
            DWORD dwRegAddress = Query2->FieldValues["RegAddress"] * 4;
            if (strRegName != strRegNamePrev)
            {
                String strRegItem;
                //strRegItem.sprintf("%s_%s", strPageName, strRegName.UpperCase());
                strRegItem.sprintf("%s", strRegName.UpperCase());
                
                sl->Add(str.sprintf("\r\n\r\n/* 0x%08x (%s) */", dwPageAddr + dwRegAddress, strRegName));

                strTmp.sprintf("%s", strRegItem);
                sl->Add(str.sprintf("#define %-64s 0x%08X\r\n", strTmp, dwPageAddr + dwRegAddress));

                strRegNamePrev = strRegName;
            }
            DWORD dwStartBit = Query2->FieldValues["StartBit"];
            DWORD dwEndBit = Query2->FieldValues["EndBit"];

            sl->Add(str.sprintf("/* [%d - %d] */", dwEndBit, dwStartBit));            
            //String strFieldItem = strTmp.sprintf("%s_%s", strPageName, strFieldName);
            String strFieldItem = strTmp.sprintf("%s", strFieldName);
            
            int extNo = 1;
            if (slFieldNames->IndexOf(strFieldItem) != -1)
            {
                String strBaseName = strFieldItem;
                do
                {
                    strFieldItem = String().sprintf("%s_%d", strBaseName, extNo ++);
                }while (slFieldNames->IndexOf(strFieldItem) != -1);
            }
            slFieldNames->Add(strFieldItem);
            
            strTmp.sprintf("%s_MSB", strFieldItem);
            sl->Add(str.sprintf("#define %-64s %d", strTmp, dwEndBit));

            strTmp.sprintf("%s_LSB", strFieldItem);
            sl->Add(str.sprintf("#define %-64s %d", strTmp, dwStartBit));

            strTmp.sprintf("%s_MASK", strFieldItem);
            DWORD dwMask = (((__int64)1 << (dwEndBit - dwStartBit + 1)) - 1) << dwStartBit;
            sl->Add(str.sprintf("#define %-64s 0x%X", strTmp, dwMask));

            strTmp.sprintf("%s_GET(x)", strFieldItem);
            sl->Add(str.sprintf("#define %-64s (((x) & %s_MASK) >> %s_LSB)", strTmp, strFieldItem, strFieldItem));

            strTmp.sprintf("%s_SET(x)", strFieldItem);
            sl->Add(str.sprintf("#define %-64s (((x) << %s_LSB) & %s_MASK)", strTmp, strFieldItem, strFieldItem));
            Query2->Next();
        }
        sl->Add("\r\n\r\n#endif");
        sl->SaveToFile(Dir + "\\" + strPageDefine + ".h");
        slIncludesAll->Add("#include \"" + strPageDefine + ".h\"");
        sl->Clear();
        Query->Next();
    }
    slIncludesAll->Add("\r\n#endif");
    slIncludesAll->SaveToFile(Dir + "\\HS_REGS_" + strDatabaseName.UpperCase() + ".h");
    delete sl;
    delete slFieldNames;
    Application->MessageBox(String().sprintf("Generating header file in <%s> done", Dir).c_str(), "Information", MB_OK + MB_ICONINFORMATION);        
}
#else
void __fastcall TFormTable::GenHeadFileClick(TObject *Sender)
{
    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }
#ifdef QUICK_DEBUG_GEN_HEADER_PATH
    AnsiString Dir = QUICK_DEBUG_GEN_HEADER_PATH;
#else
    AnsiString Dir = OpenDialog1->FileName;
    if (!DirectoryExists(Dir))
    {
        Dir = ExtractFilePath(dlgOpenImport->FileName);
    }    
    if (!SelectDirectory(Dir, TSelectDirOpts() << sdAllowCreate << sdPerformCreate << sdPrompt,0))
    {
        return;
    }
#endif    
    bool genPY = GetKeyState(VK_LCONTROL) < 0;
    TStringList *sl = new TStringList();
    TStringList *slPython = new TStringList();
    Query->Close();
    Query->SQL->Clear();
    Query->SQL->Text = AnsiString("SELECT * FROM ") + PAGETABLE + " ORDER BY ID";
    Query->Open();
    String str, strTmp;
    TStringList *slIncludesAll = new TStringList();

    slIncludesAll->Add("/* Generate by TableEditor, do not edit. */\r\n\r\n");
    slIncludesAll->Add(str.sprintf("#ifndef _HS_REGS_%s_H_", strDatabaseName.UpperCase()));
    slIncludesAll->Add(str.sprintf("#define _HS_REGS_%s_H_\r\n", strDatabaseName.UpperCase()));

    TStringList *slPageFiles = new TStringList();
    TStringList *slFieldNames = new TStringList();
    while (!Query->Eof)
    {
        DWORD dwPageAddr = 0;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREG] << 24;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREGVAL] << 16;
        dwPageAddr |= (DWORD)Query->FieldValues[SHADOWREGMASK] << 8;
        slFieldNames->Clear();
        DWORD dwPageID = Query->FieldValues[ID];
        String strPageName = Query->FieldValues["Caption"];
        strPageName = strPageName.SubString(8, strPageName.Length() - 7);

        String strPageDefine = String().sprintf("HS_PAGE_%s_%s", strDatabaseName.UpperCase(), strPageName.UpperCase());
        String strPageFileName = Dir + "\\" + strPageDefine + ".h";
        String strBaseAddrExt = "";
        while (slPageFiles->IndexOf(strPageFileName) != -1)
        {
            strPageDefine = String().sprintf("HS_PAGE_%s_%s_%02X",
                strDatabaseName.UpperCase(), strPageName.UpperCase(), (dwPageAddr >> 8) & 0xFF);
            strPageFileName = Dir + "\\" + strPageDefine + ".h";
            strBaseAddrExt = String().sprintf("_%02X", (dwPageAddr >> 8) & 0xFF);
        }
        slPageFiles->Add(strPageFileName);
        sl->Add("/* Generate by TableEditor, do not edit. */\r\n\r\n");
        sl->Add(str.sprintf("#ifndef _%s_H_", strPageDefine));
        sl->Add(str.sprintf("#define _%s_H_\r\n", strPageDefine));

        if (genPY)
        {
            slPython->Add("# -*- coding:utf-8 -*-\r\n\r\n");
            slPython->Add("import ctypes\r\n\r\n");
        }
        

        String strBaseAddr = "HS_" + strPageName + "_BASE_ADDRRESS" + strBaseAddrExt;
        sl->Add(str.sprintf("#ifndef %-64s", strBaseAddr));
        sl->Add(str.sprintf("    #define %-64s 0x%08X", strBaseAddr, dwPageAddr));
        sl->Add("#endif");

        Query2->Close();
        Query2->SQL->Text = "SELECT RegName, RegAddress, StartBit, EndBit, RegisterField.Name as FieldName, "
            "RegisterField.Description as Description "
            "FROM Register, RegisterField";
        Query2->SQL->Add("WHERE Register.ID = RegisterField.Register AND Register.Page = " + IntToStr(dwPageID));
        Query2->SQL->Add("ORDER BY Register.ID, StartBit");
        Query2->Open();
        String strRegNamePrev = "";
        DWORD dwPreEndBit = (DWORD)-1;
        int padno = 0;
        while (!Query2->Eof)
        {
            String strRegName = Query2->FieldByName("RegName")->AsString;
            String strFieldName = Query2->FieldByName("FieldName")->AsString;
            String strFieldDesc = Query2->FieldByName("Description")->AsString;
            if (strFieldName.SubString(1,9) ==  "RESERVED")
            {
                Query2->Next();
                continue;
            }

            DWORD dwRegAddress = Query2->FieldValues["RegAddress"] * 4;
            if (strRegName.LowerCase() != strRegNamePrev)
            {
                String strRegItem;
                if (!strRegNamePrev.IsEmpty())
                {
                    if (dwPreEndBit != (DWORD)-1 && dwPreEndBit != 31)
                    {
                        sl->Add(str.sprintf("    unsigned int pad%-29d :%d; /* [%02d:%02d] */",  padno, 31 - dwPreEndBit, 31, dwPreEndBit + 1));
                        if (genPY)
                        {
                            slPython->Add(str.sprintf("        (\"pad%d\", ctypes.c_uint32, %d),", padno, 31 - dwPreEndBit));
                        }
                        padno++;
                    }
                    sl->Add(str.sprintf("}; /* struct _%s */", strRegNamePrev.LowerCase()));
                    sl->Add(str.sprintf("#define %s(val) ((rs_%s*)&(val))\r\n", strRegNamePrev, strRegNamePrev));
                    if (genPY)
                    {
                        slPython->Add("    ]\r\n\r\n");
                    }
                }
                strRegItem.sprintf("%s", strRegName.UpperCase());
                
                sl->Add(str.sprintf("\r\n\r\n/* 0x%08x (%s) */", dwPageAddr + dwRegAddress, strRegName.UpperCase()));

                strTmp.sprintf("%s", strRegItem);
                sl->Add(str.sprintf("#define %-64s (%s + 0x%02X)\r\n", strTmp, strBaseAddr, dwRegAddress));

                strTmp.sprintf("%s_struct", strRegItem);
                sl->Add(str.sprintf("#define %-64s rs_%s\r\n", strTmp, strRegName.LowerCase()));

                sl->Add(str.sprintf("typedef struct _rs_%s rs_%s;",  strRegName.LowerCase(), strRegName.LowerCase()));
                sl->Add(str.sprintf("struct _rs_%s {",  strRegName.LowerCase()));
                if (genPY)
                {
                    slPython->Add(str.sprintf("class %s(ctypes.LittleEndianStructure):", strRegName));
                    slPython->Add("    _fields_ = [");
                }
                                
                strRegNamePrev = strRegName.LowerCase();
                
                slFieldNames->Clear();
                dwPreEndBit = -1;
                padno = 0;
            }
            DWORD dwStartBit = Query2->FieldValues["StartBit"];
            DWORD dwEndBit = Query2->FieldValues["EndBit"];
            if (dwPreEndBit != (DWORD)-1 && dwStartBit != dwPreEndBit + 1)
            {
                sl->Add(str.sprintf("    unsigned int pad%-29d :%d; /* [%02d:%02d] */",
                    padno, dwStartBit - dwPreEndBit - 1, dwPreEndBit, dwStartBit));
                if (genPY)
                {
                    slPython->Add(str.sprintf("        (\"pad%d\", ctypes.c_uint32, %d),", padno, dwStartBit - dwPreEndBit - 1));
                }
                padno ++;
            }
            dwPreEndBit = dwEndBit;
            int extNo = 1;
            if (slFieldNames->IndexOf(strFieldName) != -1)
            {
                String strBaseName = strFieldName;
                do
                {
                    strFieldName = String().sprintf("%s_%d", strBaseName, extNo ++);
                }while (slFieldNames->IndexOf(strFieldName) != -1);
            }
            slFieldNames->Add(strFieldName);
            if (!strFieldDesc.IsEmpty()){
                strFieldDesc = StringReplace(strFieldDesc, "\r\n", "\n", TReplaceFlags() << rfReplaceAll),
                strFieldDesc = StringReplace(strFieldDesc, "\n", "\r\n    * ", TReplaceFlags() << rfReplaceAll), 
                sl->Add(str.sprintf("    /*"));
                sl->Add(str.sprintf("    * %s", strFieldDesc));
                sl->Add(str.sprintf("    */"));
            }
            sl->Add(str.sprintf("    unsigned int %-32s :%2d; /* [%02d:%02d] */",  strFieldName, dwEndBit - dwStartBit + 1, dwEndBit, dwStartBit));
            if (genPY)
            {
                slPython->Add(str.sprintf("        (\"%s\", ctypes.c_uint32, %d), ", strFieldName, dwEndBit - dwStartBit + 1));
            }
            Query2->Next();
        }
        if (!strRegNamePrev.IsEmpty())
        {
            sl->Add(str.sprintf("}; /* struct _%s */\r\n", strRegNamePrev.LowerCase()));
            sl->Add(str.sprintf("#define %s(val) ((rs_%s*)&(val))\r\n", strRegNamePrev.LowerCase(), strRegNamePrev.LowerCase()));
            if (genPY)
            {
                slPython->Add("    ]\r\n\r\n");
            }
        }
        sl->Add("\r\n\r\n#endif");
        sl->SaveToFile(strPageFileName);
        if (genPY)
        {
            slPython->SaveToFile(Dir + "\\" + strPageDefine + ".py");
            slPython->Clear();
        }
        slIncludesAll->Add("#include \"" + strPageDefine + ".h\"");
        sl->Clear();
        Query->Next();
    }
    slIncludesAll->Add("\r\n#endif");
    slIncludesAll->SaveToFile(Dir + "\\HS_REGS_" + strDatabaseName.UpperCase() + ".h");
    delete sl;
    delete slPython;
    delete slFieldNames;
    Application->MessageBox(String().sprintf("Generating header file in <%s> done", Dir).c_str(), "Information", MB_OK + MB_ICONINFORMATION);        
}
#endif

struct xlsx_data
{
    xlsxioreader xlsxioread;
};

//---------------------------------------------------------------------------
int sheet_row_callback (size_t row, size_t maxcol, void* callbackdata)
{
  return 0;
}

int sheet_cell_callback (size_t row, size_t col, const XLSXIOCHAR* value, void* callbackdata)
{
    const char* p = value;
    if (p){
    }
    return 0;
}

int xlsx_list_sheets_callback (const char* name, void* callbackdata)
{
    struct xlsx_data *data = (struct xlsx_data *)callbackdata; 
    xlsxioread_process(data->xlsxioread, name, XLSXIOREAD_SKIP_NONE, sheet_cell_callback, sheet_row_callback, data);
    return 0;
}


void __fastcall TFormTable::btnImportClick(TObject *Sender)
{
    if (!TabTable->Active)
    {
        ShowMessage("Open MDB file first!");
        return;
    }

#ifdef QUICK_DEBUG_CSV
    DoImport(QUICK_DEBUG_CSV);
    return;
#else
    if (!dlgOpenImport->Execute())
    {
        return;
    }
    auto_ptr<TfrmImportChoice> frmImportChoice(new TfrmImportChoice(this));
    if (frmImportChoice->ShowModal() != mrOk)
    {
        return;
    }
    this->importRegType = (EImportRegType)frmImportChoice->rbRegType->ItemIndex;
    pbImport->Visible = true;
    pbImport->Min = 0;
    pbImport->Max = dlgOpenImport->Files->Count - 1;
    for (int i =0; i < dlgOpenImport->Files->Count; i ++)
    {
        DoImport(dlgOpenImport->Files->Strings[i]);
        pbImport->StepIt();
        Application->ProcessMessages();
    }
    pbImport->Visible = false;
#endif
}
//---------------------------------------------------------------------------


