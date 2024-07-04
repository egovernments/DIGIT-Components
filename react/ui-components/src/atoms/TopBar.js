import React, { useEffect, useState, Fragment } from "react";
import PropTypes from "prop-types";
import Hamburger from "./Hamburger";

const TopBar = ({
  img,
  className,
  style,
  theme,
  setImageToLeft,
  onImageClick,
  onLogoClick,
  onHamburgerClick,
  props,
  logo,
  ulb,
  actionFields,
}) => {
  const [isMobileView, setIsMobileView] = useState(window.innerWidth <= 768);
  const onResize = () => {
    if (window.innerWidth <= 768) {
      if (!isMobileView) {
        setIsMobileView(true);
      }
    } else {
      if (isMobileView) {
        setIsMobileView(false);
      }
    }
  };
  useEffect(() => {
    window.addEventListener("resize", () => {
      onResize();
    });
    return () => {
      window.addEventListener("resize", () => {
        onResize();
      });
    };
  });

  if (isMobileView) {
    return (
      <div
        className={`digit-topbar ${className || ""} ${theme || ""}`}
        style={style}
      >
        <Hamburger
          className={`digit-topbar-hamburger ${theme || ""} ${
            onHamburgerClick ? "clickable" : ""
          }`}
          handleClick={onHamburgerClick}
          color={theme === "dark" ? "#FFFFFF" : "#363636"}
        />
        <div className="digit-header-img-ulb-wrapper-mobileview">
          <img
            className={`digit-header-img ${onImageClick ? "clickable" : ""}`}
            alt="Powered by DIGIT"
            src={
              img ||
              (theme === "dark"
                ? "https://egov-dev-assets.s3.ap-south-1.amazonaws.com/digit.png"
                : "https://egov-uat-assets.s3.ap-south-1.amazonaws.com/hcm/mseva-white-logo.png")
            }
            onClick={() => onImageClick()}
            width={"80px"}
            height={"19px"}
          />
          <div className={`topbar-divider ${theme || ""}`}></div>
          <div className={`digit-topbar-ulb-mobileview ${theme || ""}`}>
            {ulb}
          </div>
        </div>
      </div>
    );
  }

  return (
    <div
      className={`digit-topbar ${className || ""} ${theme || ""}`}
      style={style}
    >
      {!setImageToLeft && (
        <div className="digit-logo-ulb-wrapper">
          {logo && (
            <div
              className={`digit-topbar-logo ${onLogoClick ? "clickable" : ""}`}
            >
              <img
                className="digit-header-logo-img"
                alt="Logo"
                src={logo}
                onClick={() => onLogoClick()}
                width={props?.logoWidth || "32px"}
                height={props?.logoHeight || "32px"}
              />
            </div>
          )}
          <div className="digit-topbar-ulb">{ulb}</div>
        </div>
      )}
      {setImageToLeft && (
        <div className="digit-logo-ulb-wrapper">
          <img
            className={`digit-header-img ${onImageClick ? "clickable" : ""}`}
            alt="Powered by DIGIT"
            src={
              img ||
              (theme === "dark"
                ? "https://egov-dev-assets.s3.ap-south-1.amazonaws.com/digit.png"
                : "https://egov-uat-assets.s3.ap-south-1.amazonaws.com/hcm/mseva-white-logo.png")
            }
            onClick={() => onImageClick()}
            width={"80px"}
            height={"19px"}
          />
        </div>
      )}
      <div className="digit-header-action-fields">
        {actionFields && (
          <>
            {actionFields.map((field, index) => (
              <div className="individual-action-field" key={index}>
                {field}
              </div>
            ))}
          </>
        )}
        {
          (!setImageToLeft) && (
            <img
              className={`digit-header-img ${onImageClick ? "clickable" : ""}`}
              alt="Powered by DIGIT"
              src={
                img ||
                (theme === "dark"
                  ? "https://egov-dev-assets.s3.ap-south-1.amazonaws.com/digit.png"
                  : "https://egov-uat-assets.s3.ap-south-1.amazonaws.com/hcm/mseva-white-logo.png")
              }
              onClick={() => onImageClick()}
              width={"80px"}
              height={"19px"}
            />
          )
        }
      </div>
    </div>
  );
};
TopBar.propTypes = {
  img: PropTypes.string,
  className: PropTypes.string,
  style: PropTypes.object,
  theme: PropTypes.string,
  setImageToLeft: PropTypes.bool,
  onImageClick: PropTypes.func,
  onLogoClick: PropTypes.func,
  onHamburgerClick: PropTypes.func,
  props: PropTypes.object,
  logo: PropTypes.string,
};
TopBar.defaultProps = {
  img: undefined,
};
export default TopBar;
