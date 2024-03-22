import { Button, Card ,SubmitBar,Loader} from "@egovernments/digit-ui-components";
import React, { useState } from "react";
import { useTranslation } from "react-i18next";
import { useHistory } from "react-router-dom";
import Background from "../../../components/Background";

const LanguageSelection = () => {
  const { data: storeData, isLoading } = Digit.Hooks.useStore.getInitData();
  const { t } = useTranslation();
  const history = useHistory();
  const { languages, stateInfo } = storeData || {};
  const selectedLanguage = Digit.StoreData.getCurrentLanguage();
  const [selected, setselected] = useState(selectedLanguage);
  const handleChangeLanguage = (language) => {
    setselected(language.value);
    Digit.LocalizationService.changeLanguage(language.value, stateInfo.code);
  };

  const handleSubmit = (event) => {
    history.push(`/${window?.contextPath}/employee/user/login`);
  };

  if (isLoading) return <Loader/>;
  let defaultLanguages=languages;
  if(!defaultLanguages || defaultLanguages?.length==0){
defaultLanguages=[{label:"English",value:"en_IN"}]
  }

  return (
    <Background>
      <Card className="bannerCard removeBottomMargin">
        <div className="bannerHeader">
          <img className="bannerLogo" src={stateInfo?.logoUrl} alt="Digit" />

          <p>{t(`TENANT_TENANTS_${stateInfo?.code?.toUpperCase()}`)}</p>
        </div>
        <div className="language-selector" style={{ justifyContent: "space-around", marginBottom: "24px", padding: "0 5%" }}>
          {defaultLanguages.map((language, index) => (
            <div className="language-button-container" key={index}>
              <Button
                label={language.label}
                onClick={() => handleChangeLanguage(language)}
                variation={language.value === selected ? "primary" : ""}
                style={{boxShadow: "0px 0px 0px 0px",width:"100%"}}
              />
            </div>
          ))}
        </div>
        <SubmitBar style={{ width: "100%" }} label={t(`CORE_COMMON_CONTINUE`)} onSubmit={handleSubmit}/>
      </Card>
      <div className="EmployeeLoginFooter">
        <img
          alt="Powered by DIGIT"
          src={window?.globalConfigs?.getConfig?.("DIGIT_FOOTER_BW")}
          style={{ cursor: "pointer" }}
          onClick={() => {
            window.open(window?.globalConfigs?.getConfig?.("DIGIT_HOME_URL"), "_blank").focus();
          }}
        />{" "}
      </div>
    </Background>
  );
};

export default LanguageSelection;
