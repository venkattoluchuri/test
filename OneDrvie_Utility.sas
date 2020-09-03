%optumizeoffice365(name= OneDriveToSas
               ,Directory =%nrbquote(/Attachments/)
               ,source_file = %nrbquote(iris.xlsx)
               ,target_path=%nrbquote(/sastmp/onedrive)
               ,SASFORMAT=No   );


%optumizeoffice365(name= SasToOneDrive
               ,Directory =%nrbquote(/Attachments/)
               ,Input_TYPE=TPFiles
               ,source_path=%nrbquote(/sastmp/onedrive/)
               ,source_file = %nrbquote(config.json)
               ,target_file=%nrbquote(config.json));