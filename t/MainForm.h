//---------------------------------------------------------------------------

#ifndef MainFormH
#define MainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ADODB.hpp>
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <Mask.hpp>
#include "RxDBComb.hpp"
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include <Graphics.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include "RxLookup.hpp"
#include "DBNavigatorEx.h"

#include "PageTypePlugin.h"
#include "Register.h"
#include "Placemnt.hpp"
#include "RxCombos.hpp"
#include <ImgList.hpp>
#include <ToolWin.hpp>
#include <memory>
#include <set>



using namespace std;

typedef struct
{
    TGridCoord gc;
    int        iRegisterID;
    int        iMask;
} FilteredRegister;


class HeadFile
{
private:
    TStringList *_list;

public:
    HeadFile()
    {
        _list = new TStringList();
    }
    ~HeadFile()
    {
        if (_list)
        {
            delete _list;
            _list = NULL;
        }
    }
public:
    void __fastcall AddInfo(AnsiString str)
    {
        if (_list)
            _list->Add(str);
    }

    bool __fastcall HasError()
    {
        if (_list)
            return (BOOL)_list->Count;
        else
            false;

        return false;
    }

    void __fastcall SaveToFile(AnsiString filename)
    {
        if (!_list)
            return;

        FILE *pFile;
        pFile = fopen(filename.c_str(), "w");

        if (pFile !=  NULL)
        {
            for (int i = 0; i < _list->Count; i++)
            {
                fprintf(pFile, _list->Strings[i].c_str());
                fprintf(pFile, "\n");
            }
        }

        fclose(pFile);
    }
};
//---------------------------------------------------------------------------
class BuildOptions
{
public:
    bool        PageTagEnabled;
    AnsiString  PageTagEqual;
    int         PageTag;

    bool        RegFlagEnabled;
    int         RegFlag;

    set< int >  TabId;
    set< int >  PageId;
    set< int >  FilterId;
};

//---------------------------------------------------------------------------
class TFormTable : public TForm
{
__published:	// IDE-managed Components
    TPageControl *PageControl1;
    TTabSheet *TabSheet1;
    TTabSheet *TabSheet2;
    TDataSource *TabSource;
    TADOConnection *ADOConnection1;
    TADOTable *TabTable;
    TADOTable *PageTable;
    TADOTable *RegisterTable;
    TADOTable *FilterTable;
    TADOTable *RegFilterMaskTable;
    TDataSource *FilterSource;
    TDataSource *PageSource;
    TDataSource *RegFilterMaskSource;
    TDataSource *RegisterSource;
    TTabSheet *TabSheet3;
    TLabel *Label17;
    TDBLookupListBox *llbFilter;
    TButton *btnExit;
    TButton *btnGenerate;
    TSaveDialog *SaveDialog1;
    TOpenDialog *OpenDialog1;
    TButton *btnLoad;
    TDataSource *LookupPageSource;
    TADOTable *LookupPageTable;
    TButton *btnBackup;
    TButton *btnMerge;
    TADOQuery *Query;
    TPanel *plRegister;
    TLabel *Label3;
    TDBEdit *dedRegName;
    TLabel *Label4;
    TDBEdit *dedRegAddress;
    TLabel *lblDefaultVal;
    TDBEdit *dedDefaultVal;
    TPageControl *pcBitAccessRight;
    TTabSheet *tsBit00;
    TLabel *Label5;
    TLabel *Label6;
    TLabel *Label7;
    TLabel *Label8;
    TLabel *Label9;
    TLabel *Label10;
    TLabel *Label11;
    TLabel *Label12;
    TRxDBComboBox *RxDBComboBox1;
    TRxDBComboBox *RxDBComboBox2;
    TRxDBComboBox *RxDBComboBox3;
    TRxDBComboBox *RxDBComboBox4;
    TRxDBComboBox *RxDBComboBox5;
    TRxDBComboBox *RxDBComboBox6;
    TRxDBComboBox *RxDBComboBox7;
    TRxDBComboBox *RxDBComboBox8;
    TTabSheet *tsBit08;
    TLabel *Label38;
    TLabel *Label39;
    TLabel *Label40;
    TLabel *Label41;
    TLabel *Label42;
    TLabel *Label43;
    TLabel *Label45;
    TLabel *Label46;
    TRxDBComboBox *RxDBComboBox9;
    TRxDBComboBox *RxDBComboBox10;
    TRxDBComboBox *RxDBComboBox11;
    TRxDBComboBox *RxDBComboBox12;
    TRxDBComboBox *RxDBComboBox13;
    TRxDBComboBox *RxDBComboBox14;
    TRxDBComboBox *RxDBComboBox15;
    TRxDBComboBox *RxDBComboBox16;
    TTabSheet *tsBit16;
    TLabel *Label47;
    TLabel *Label48;
    TLabel *Label49;
    TLabel *Label50;
    TLabel *Label51;
    TLabel *Label52;
    TLabel *Label53;
    TLabel *Label54;
    TRxDBComboBox *RxDBComboBox17;
    TRxDBComboBox *RxDBComboBox18;
    TRxDBComboBox *RxDBComboBox19;
    TRxDBComboBox *RxDBComboBox20;
    TRxDBComboBox *RxDBComboBox21;
    TRxDBComboBox *RxDBComboBox22;
    TRxDBComboBox *RxDBComboBox23;
    TRxDBComboBox *RxDBComboBox24;
    TTabSheet *tsBit24;
    TLabel *Label55;
    TLabel *Label56;
    TLabel *Label57;
    TLabel *Label58;
    TLabel *Label59;
    TLabel *Label60;
    TLabel *Label61;
    TLabel *Label62;
    TRxDBComboBox *RxDBComboBox25;
    TRxDBComboBox *RxDBComboBox26;
    TRxDBComboBox *RxDBComboBox27;
    TRxDBComboBox *RxDBComboBox28;
    TRxDBComboBox *RxDBComboBox29;
    TRxDBComboBox *RxDBComboBox30;
    TRxDBComboBox *RxDBComboBox31;
    TRxDBComboBox *RxDBComboBox32;
    TLabel *Label20;
    TPanel *Panel2;
    TLabel *Label1;
    TDBEdit *DBEdit2;
    TLabel *Label23;
    TPanel *Panel3;
    TLabel *Label2;
    TDBEdit *DBEdit1;
    TLabel *Label24;
    TWordField *PageTablePageRegVal;
    TWordField *PageTableShadowReg;
    TAutoIncField *PageTableID;
    TWordField *PageTablePageType;
    TWordField *PageTableShadowRegVal;
    TWordField *PageTableShadowRegMask;
    TWordField *PageTableIndexReg;
    TWordField *PageTableDataReg;
    TWordField *PageTableRegAddressSize;
    TWordField *PageTableRegDataSize;
    TWideStringField *PageTableDescription;
    TIntegerField *PageTableTab;
    TDBLookupListBox *llbTab;
    TDBLookupListBox *llbPage;
    TAutoIncField *RegisterTableID;
    TWideStringField *RegisterTableRegName;
    TIntegerField *RegisterTablePage;
    TIntegerField *RegisterTableRegAddress;
    TMemoField *RegisterTableDescription;
    TIntegerField *RegisterTableDefaultVal;
    TDBNavigatorEx *nvTab;
    TDBNavigatorEx *nvPage;
    TDBNavigatorEx *nvRegister;
    TDBNavigatorEx *nvFilter;
    TPanel *plPage;
    TButton *btnGetDefault;
    TStringGrid *StringGridReg;
    TLabel *Label34;
    TDBLookupComboBox *lcbPage;
    TLabel *Label15;
    TDBEdit *dedFilterCaption;
    TDBLookupComboBox *lcbPage2;
    TStringGrid *StringGridReg2;
    TPageControl *pcMask;
    TTabSheet *tsBit15;
    TTabSheet *tsBit31;
    TLabel *lblBitMask;
    TLabel *Label14;
    TDBEdit *DBEdit9;
    TIntegerField *PageTableTag;
    TCheckBox *cbInFilter;
    TLabel *Label13;
    TRxDBComboBox *RxDBComboBox33;
    TIntegerField *RegisterTableFlag;
    TLabel *Label16;
    TDBEdit *DBEdit10;
    TWideStringField *PageTableName;
    TButton *btnCopy;
    TButton *btnReadOnly;
    TPopupMenu *popBit;
    TMenuItem *NotUsed1;
    TMenuItem *ReadOnly1;
    TMenuItem *WriteOnly1;
    TMenuItem *ReadWrite1;
    TLabel *Label69;
    TRxDBComboBox *dbcbPageType;
    TPanel *Panel4;
    TLabel *lblPageRegVal;
    TLabel *lblShadowReg;
    TLabel *lblShadowRegVal;
    TLabel *lblShadowRegMask;
    TLabel *lblIndexReg;
    TLabel *lblDataReg;
    TLabel *lblRegAddrSize;
    TLabel *lblRegDataSize;
    TDBEdit *dedPageRegVal;
    TDBEdit *dedShadowReg;
    TDBEdit *dedShadowRegVal;
    TDBEdit *dedShadowRegMask;
    TDBEdit *dedIndexReg;
    TDBEdit *dedDataReg;
    TDBEdit *dedRegAddrSize;
    TDBEdit *dedRegDataSize;
    TFormPlacement *FormPlacement1;
    TLabel *Label18;
    TDBEdit *DBEdit3;
    TWordField *PageTableSlaveAddr;
    TButton *btnCreate;
    TSaveDialog *SaveDialog2;
    TADOTable *RegFilterMaskTable2;
    TADOTable *FilterTable2;
    TADOTable *RegisterTable2;
    TADOTable *PageTable2;
    TADOTable *TabTable2;
    TADOConnection *ADOConnection2;
    TIntegerField *PageTableColumn;
    TIntegerField *PageTableRow;
    TLabel *Label19;
    TDBEdit *DBEdit4;
    TLabel *Label21;
    TDBEdit *DBEdit5;
    TToolBar *ToolBar1;
    TToolButton *CutButton;
    TToolButton *CopyButton;
    TToolButton *PasteButton;
    TToolButton *ToolButton4;
    TFontComboBox *FontName;
    TColorComboBox *FontColor;
    TEdit *FontSize;
    TUpDown *UpDown1;
    TToolButton *ToolButton5;
    TToolButton *BoldButton;
    TToolButton *ItalicButton;
    TToolButton *UnderlineButton;
    TToolButton *ToolButton9;
    TToolButton *LeftAlign;
    TToolButton *CenterAlign;
    TToolButton *RightAlign;
    TToolButton *ToolButton13;
    TToolButton *BulletsButton;
    TImageList *ImageList1;
    TCheckBox *cbAddAll;
    TButton *btnGenDoc;
    TRichEdit *RichEdit1;
    TSaveDialog *SaveDialog3;
    TButton *btnAutoGetReadonlyAttr;
    TButton *cbSetRW;
    TButton *btnSetAll;
    TDBRichEdit *DBMemo1;
    TDBLookupListBox *dblklstdblkCopyPage;
    TButton *btnCopyFromMDB;
    TDataSource *dsCopyPageSource;
    TADOTable *tblCopyPageTable;
    TADOConnection *conADOConnection3;
    TButton *btnCopyPage;
    TADOTable *tblCopySource;
    TADOTable *tblCopyTarget;
    TButton *btnSetAllWrite;
    TButton *btnSetAllRead;
    TOpenDialog *dlgOpenImport;
    TButton *GenHeadFile;
    TSaveDialog *dlgSaveFile;
    TADOTable *RegisterFieldTable;
    TDataSource *RegisterFieldSource;
    TProgressBar *pbImport;
    TButton *btnImport;
    TADOQuery *Query2;
    void __fastcall btnExitClick(TObject *Sender);
    void __fastcall btnGenerateClick(TObject *Sender);
    void __fastcall btnLoadClick(TObject *Sender);
    void __fastcall dedPageRegValChange(TObject *Sender);
    void __fastcall PageTableAfterPost(TDataSet *DataSet);
    void __fastcall dbcbPageTypeChange(TObject *Sender);
    void __fastcall PageTableAfterScroll(TDataSet *DataSet);
    void __fastcall lcbPageClick(TObject *Sender);
    void __fastcall RegisterTableAfterPost(TDataSet *DataSet);
    void __fastcall GetHexText(TField *Sender,
                               AnsiString &Text, bool DisplayText);
    void __fastcall SetHexText(TField *Sender, const AnsiString Text);
    void __fastcall RegisterTableAfterScroll(TDataSet *DataSet);
    void __fastcall StringGridRegSelectCell(TObject *Sender, int ACol,
                                            int ARow, bool &CanSelect);
    void __fastcall RegisterTableAfterEdit(TDataSet *DataSet);
    void __fastcall RegisterTableAfterInsert(TDataSet *DataSet);
    void __fastcall RegisterTableAfterCancel(TDataSet *DataSet);
    void __fastcall PageTableAfterInsert(TDataSet *DataSet);
    void __fastcall TabTableAfterScroll(TDataSet *DataSet);
    void __fastcall TabTableBeforeDelete(TDataSet *DataSet);
    void __fastcall PageTableBeforeDelete(TDataSet *DataSet);
    void __fastcall FilterTableAfterInsert(TDataSet *DataSet);
    void __fastcall FilterTableAfterPost(TDataSet *DataSet);
    void __fastcall lcbPage2Click(TObject *Sender);
    void __fastcall StringGridReg2DrawCell(TObject *Sender, int ACol,
                                           int ARow, TRect &Rect, TGridDrawState State);
    void __fastcall StringGridReg2MouseUp(TObject *Sender,
                                          TMouseButton Button, TShiftState Shift, int X, int Y);
    void __fastcall FilterTableAfterScroll(TDataSet *DataSet);
    void __fastcall cbInFilterClick(TObject *Sender);
    void __fastcall StringGridReg2SelectCell(TObject *Sender, int ACol,
            int ARow, bool &CanSelect);
    void __fastcall RegisterTableBeforeDelete(TDataSet *DataSet);
    void __fastcall FilterTableBeforeDelete(TDataSet *DataSet);
    void __fastcall btnCopyClick(TObject *Sender);
    void __fastcall btnReadOnlyMouseUp(TObject *Sender,
                                       TMouseButton Button, TShiftState Shift, int X, int Y);
    void __fastcall bitMenuClick(TObject *Sender);
    void __fastcall RegisterTableBeforePost(TDataSet *DataSet);
    void __fastcall btnCreateClick(TObject *Sender);
    void __fastcall btnBackupClick(TObject *Sender);
    void __fastcall btnMergeClick(TObject *Sender);
    void __fastcall EditCutClick(TObject *Sender);
    void __fastcall EditCopyClick(TObject *Sender);
    void __fastcall EditPasteClick(TObject *Sender);
    void __fastcall BoldButtonClick(TObject *Sender);
    void __fastcall ItalicButtonClick(TObject *Sender);
    void __fastcall UnderlineButtonClick(TObject *Sender);
    void __fastcall FontSizeChange(TObject *Sender);
    void __fastcall BulletsButtonClick(TObject *Sender);
    void __fastcall AlignClick(TObject *Sender);
    void __fastcall DBMemo1SelectionChange(TObject *Sender);
    void __fastcall FontNameChange(TObject *Sender);
    void __fastcall FontColorChange(TObject *Sender);
    void __fastcall DBMemo1Enter(TObject *Sender);
    void __fastcall DBMemo1Exit(TObject *Sender);
    void __fastcall btnGetDefaultClick(TObject *Sender);
    void __fastcall btnGenDocClick(TObject *Sender);
    void __fastcall cbSetRWClick(TObject *Sender);
    void __fastcall btnCopyFromMDBClick(TObject *Sender);
    void __fastcall btnCopyPageClick(TObject *Sender);
    void __fastcall btnSetAllClick(TObject *Sender);
    void __fastcall StringGridRegKeyPress(TObject *Sender, char &Key);
    void __fastcall btnSetAllWriteClick(TObject *Sender);
    void __fastcall btnSetAllReadClick(TObject *Sender);
    void __fastcall GenHeadFileClick(TObject *Sender);
    void __fastcall btnImportClick(TObject *Sender);
private:	// User declarations
    TCheckBox *cbBit[32];
    TLabel    *lblBit[32];
    bool       bDontCheckBoxClick;
    bool       FUpdating;
    bool       bInInsert;
    vector<FilteredRegister> frRegisters;
    TTextAttributes *__fastcall CurrText(void);
    vector<PTPlugin*>    ptPlugins;
    vector<IPageObject*> ipoPageTypes;
    AnsiString           strDatabaseName;
    DWORD    GetPageAddressStart(const String& strPageName);
    DWORD TFormTable::StrToHex(const AnsiString str);
public:		// User declarations
    AnsiString ExtractDatabaseName(AnsiString strFileName);
    __fastcall TFormTable(TComponent* Owner);
    __fastcall ~TFormTable();
    void __fastcall ConstructChipData(ChipData * cd, int iTableNo, BuildOptions * opt);
    void __fastcall cbBitClick(TObject *Sender);
    void __fastcall StringGridReg2Selected(TGridRect gr);
    DWORD __fastcall GetAddressStart(TDataSet * DataSet);
    DWORD __fastcall GetAddressStep(TDataSet * DataSet);
private:
    String strTempName, strImportFileName;
    DWORD strTempNameCount;
    struct CSVRegField
    {
        BYTE ucStartBit;
        BYTE ucEndBit;
        String strRW;
        DWORD dwDefault;
        String strName;
        String strRegField;
        String strDesc;
    };
    struct CSVRegister
    {
        String strTabName;
        String strPageName;
        DWORD dwAddr;
        String strName;
        String strPageType;
        BYTE ucBits;
        DWORD dwDefaultVal;
        String strRW;
        String strComment;
        BYTE ucRight[32];
        vector<CSVRegField> vecField;
    };
    enum CSVStage
    {
        STAGE_INIT,
        STAGE_TAB_NAME,
        STAGE_PAGE_NAME,
        STAGE_TITLE,
        STAGE_REG,
        STAGE_REG1,
    };
    enum EImportRegType
    {
        IMPORT_REG_NORMAL = 0,
        IMPORT_REG_SFR,
    };
    int iRegCount;
    DWORD dwPageOffset;
    CSVStage csvStage;
    String strCSVTabName;
    String strCSVPageName;
    DWORD dwCSVBaseAddr;
    CSVRegister csvRegister;
    vector<CSVRegister> vecCSVRegister;
    vector<String> vecCSVFields;
    EImportRegType importRegType;
    static void ParseField (void *s, size_t i, void *p);
    static void ParseRow (int c, void *p);
    void AddCSVRegister(CSVRegister& csvRegister);
    void DoImport(const String& strFileName);
    void AddCSVField(const String& strField);
    void AddCSVRow(int row);
    void ClearCSVRows();
    int GetTabID(const String& strTabName);
    int GetPageID(const String& strPageName, const String& strPageCaption, DWORD dwPageAddr, BYTE ucPageRegDataSize, int nTabID);
    int GetLastRegID();
    void OpenMDB(const String& strFileName);
    void AddRegister(int iAddr, bool addOffset);
    void ImportPage();
};
//---------------------------------------------------------------------------
extern PACKAGE TFormTable *FormTable;
//---------------------------------------------------------------------------
#endif
