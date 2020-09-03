	/********************************************************/
/*  Set the variables that will be needed through the code*/
/*  We'll need these for authorization and also for runtime */
/*  use of the service.*/
/*  Reading these from a config.json file so that the values*/
/*  are easy to adapt for different users or projects.*/

%let config_root=/sastmp/onedrive/;
%macro js_setup;
%if %symexist(config_root) %then %do;
  filename config "&config_root./config.json";
  libname config json fileref=config;
  data _null_;
   set config.root;
   call symputx('tenant_id',tenant_id,'G');
   call symputx('client_id',client_id,'G');
   call symputx('redirect_uri',redirect_uri,'G');
   call symputx('resource',resource,'G');
  run;
%end;
%else %do;
  %put ERROR: You must define the CONFIG_ROOT macro variable.;
%end;
%mend js_setup;
%js_setup;

/*%include "/sas/scripts/OPTUMize/OPTUMize_Services/macros/onedrive_config.sas";*/

/* Run this line to build the authorization URL */
%let authorize_url=https://login.microsoftonline.com/&tenant_id./oauth2/authorize?client_id=&client_id.%nrstr(&response_type)=code%nrstr(&redirect_uri)=&redirect_uri.%nrstr(&resource)=&resource.;
options nosource;
%put Paste this URL into your web browser:;
%put -- START -------;
%put &authorize_url;
%put ---END ---------;
options source;
