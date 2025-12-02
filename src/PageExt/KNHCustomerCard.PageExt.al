pageextension 53801 KNHCustomerCard extends "Customer Card"
{
    actions
    {
        addlast("F&unctions")
        {
            fileuploadaction(UploadMultipleFiles)
            {
                ApplicationArea = All;
                Caption = 'Upload Multiple Files';
                AllowMultipleFiles = true;
                AllowedFileExtensions = '.jpeg', '.jpg';
                ToolTip = 'Multiple Files Upload.';

                trigger OnAction(Files: List of [FileUpload])
                var
                    UploadFile: FileUpload;
                    FileInStream: InStream;
                begin
                    foreach UploadFile in Files do begin
                        UploadFile.CreateInStream(FileInStream, TextEncoding::UTF8);
                        Rec.Image.ImportStream(FileInStream, '');
                        Message('File Name: %1', UploadFile.FileName);
                    end;
                    Rec.Modify(true);
                end;
            }
        }
    }
}