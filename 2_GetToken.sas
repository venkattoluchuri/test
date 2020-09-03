/*comments added by Venkat*/
%let config_root=/sastmp/onedrive;

/*%include "&config_root./onedrive_config.sas";*/
%include "&config_root./onedrive_macros.sas";

filename token "~/token.json";
%let auth_code=AQABAAIAAAAGV_bv21oQQ4ROqh0_1-tAzIJQuS81OqmbTzAumahGWTQjJVnPkQVwM-tsMnkhN3cxm-H6X0nZt-bWNuL7lLPmBiqA7GZ4QpjSvoI0PRyLLyidYbng2o0r2hHyAWDWdUtRQuMBO5kl4QuDyK8tshAkTGNj4RvnKfO4gapSutq1anVGcieZovJKQrt356nwdN0PKSkr9P3k3wPlfNB_XiivB4OlNAFW1TGO2-AMgmT6k521SdJGrrz_tXOMo4DM7B3wv0pneEplJNg41qBdnkCQlPYSLou9KOVqPE-aRFFZ-qmCTFhNLjgiHWYVEyYMFh6PVUnEx_ujoU9Re9bSIB2YpaKUM0MWqTWmA2vxyzMOyyUiX-iHRvw-xwru2XUunTVNFklK-wc__jZ7RelMSOel4N37aQHfYI7NZ6wEyPoWpcXgM5fZQlaab_TfbRFLiRrCc4wsq-lM1UoDduWxobXZZOWM_rF-7Bn3tsJVDZJgCuNolBW0IO1aQ6T_Lu4xfLvAZq0zy_ZN_sA5fUsMqikHOtWjj5-rMzNkHujWu-RMylj4IdvoBV6WIE6N9ILVJzAnKDZ3rEeHgzZL7G49-DG17ftOiyTj1leNq5ZgB8cRx8LRUNwNvC_jzTrxAHlLuguJC9okUNgO5WStvC8BwgJux85oPhYwsFCK0v1ddk0ySdjnvXSL5lHF81n84VXcidiVAPuy-W1QAncnTjw2UaPeIAA;

/*
  Now that we have an authorization code we can get the access token
  This step will write the tokens.json file that we can use in our
  production programs.
*/
%get_token(&client_id.,&auth_code,&resource.,token,tenant=&tenant_id);
