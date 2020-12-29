//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("TableEditor.res");
USEUNIT("Done.cpp");
USEUNIT("Register.cpp");
USEFORM("CopyForm.cpp", FormCopy);
USE("TableEditor.todo", ToDo);
USEFORM("ReplaceConfirmForm.cpp", FormReplaceConfirm);
USEFORM("BuildOptionsForm.cpp", FormBuildOptions);
USEUNIT("PageTypePlugin.cpp");
USEUNIT("XMLParser.cpp");
USEUNIT("TdfParser.cpp");
USEUNIT("RegRestorer.cpp");
USEFORM("MainForm.cpp", FormTable);
USEUNIT("ChipDoc.cpp");
USEUNIT("ReadWriteData.cpp");
USEUNIT("Utils.cpp");
USEFORM("TableCheckForm.cpp", frmTableCheck);
USEUNIT("libcsv.c");
USEFORM("ImportChoice.cpp", frmImportChoice);
USELIB("..\xlsxio\bin\libxlsxio_read.lib");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
        Application->CreateForm(__classid(TFormTable), &FormTable);
        Application->Run();
    }
    catch (Exception &exception)
    {
        Application->ShowException(&exception);
    }

    return 0;
}
//---------------------------------------------------------------------------

