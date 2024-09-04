import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { SVG } from "./SVG";
import { Colors } from "../constants/colors/colorconstants";
import { iconRender } from "../utils/iconRender";
import { Spacers } from "../constants/spacers/spacers";
import Divider from "./Divider";

const Accordion = ({
  title,
  content,
  icon,
  iconFill,
  iconWidth,
  iconHeight,
  number,
  isOpenInitially,
  onToggle,
  customClassName,
  customStyles,
  hideCardBorder,
  hideDivider,
  hideCardBg,
  hideBorderRadius,
  isClosed
}) => {
  const [isOpen, setIsOpen] = useState(isOpenInitially);

  const iconColor = Colors.lightTheme.text.primary;
  const toggleiconSize = Spacers.spacer8;
  const iconSize = Spacers.spacer6;

  const handleToggle = () => {
    setIsOpen(!isOpen);
    onToggle && onToggle(!isOpen);
  };

  useEffect(() => {
    if (isClosed !== undefined && isClosed) {
      setIsOpen(false);
    }
  }, [isClosed]);


  return (
    <div
      className={`digit-accordion-container ${customClassName} ${
        !hideCardBorder ? "border" : ""
      } ${!hideBorderRadius ? "borderRadius" : ""} ${
        !hideCardBg ? "cardBg" : ""
      } ${!hideDivider ? "divider" : ""} ${
        hideDivider && isOpen ? "no-divider" : ""
      }`}
      style={customStyles}
    >
      <div className="digit-accordion-header" onClick={handleToggle}>
        {icon && (
          <div className="digit-accordion-icon">
            {iconRender(
              icon,
              iconFill || iconColor,
              iconWidth || iconSize,
              iconHeight || iconSize,
              `digit-accordion-icon`
            )}
          </div>
        )}
        {number && (
          <div className="digit-accordion-number">
            {number}
            {"."}
          </div>
        )}
        <div className="digit-accordion-title">{title}</div>
        <div className={`digit-accordion-toggle ${isOpen ? "animate-open" : "animate-close"}`}>
            <SVG.ChevronLeft
              fill={iconColor}
              width={toggleiconSize}
              height={toggleiconSize}
            ></SVG.ChevronLeft>
        </div>
      </div>
      {isOpen && !isClosed && <div className="digit-accordion-content">{content}</div>}
    </div>
  );
};

Accordion.propTypes = {
  title: PropTypes.string.isRequired,
  content: PropTypes.node.isRequired,
  icon: PropTypes.string,
  iconFill:PropTypes.string,
  iconWidth:PropTypes.string,
  iconHeight:PropTypes.string,
  number: PropTypes.node,
  isOpenInitially: PropTypes.bool,
  hideCardBorder: PropTypes.bool,
  hideDivider: PropTypes.bool,
  hideCardBg: PropTypes.bool,
  hideBorderRadius: PropTypes.bool,
  onToggle: PropTypes.func,
  customClassName: PropTypes.string,
  customStyles: PropTypes.object,
  isClosed: PropTypes.bool,
};

Accordion.defaultProps = {
  icon: null,
  number: null,
  isOpenInitially: false,
  customClassName: "",
  customStyles: {},
  hideCardBorder: false,
  hideDivider: false,
  hideCardBg: false,
  hideBorderRadius: false,
  isClosed:false
};

const AccordionWrapper = ({
  children,
  allowMultipleOpen,
  addDivider,
  className,
  styles
}) => {
  const [openIndex, setOpenIndex] = useState(
    allowMultipleOpen ? [] : -1
  );

  const handleToggle = (index) => {
    if (allowMultipleOpen) {
      setOpenIndex((prevState) =>
        prevState?.includes(index)
          ? prevState?.filter((i) => i !== index)
          : [...prevState, index]
      );
    } else {
      setOpenIndex(index === openIndex ? -1 : index);
    }
  };

  useEffect(() => {
  },[openIndex]);

  return (
    <div className={`digit-accordion-wrapper ${className}`} style={styles}>
      {React.Children.map(children, (child, index) => (
        <React.Fragment key={index}>
          {React.cloneElement(child, {
           isClosed: allowMultipleOpen
           ? openIndex.length >0 && !openIndex.includes(index)
           : openIndex !== index,
            onToggle: () => handleToggle(index)
          })}
          {addDivider && index < React.Children.count(children) - 1 && <Divider className="digit-accordion-divider"  variant={"small"}/>}
        </React.Fragment>
      ))}
    </div>
  );
};

AccordionWrapper.propTypes = {
  children: PropTypes.node.isRequired,
  allowMultipleOpen: PropTypes.bool,
  addDivider: PropTypes.bool,
  customClassName: PropTypes.string,
  customStyles: PropTypes.object,
};

AccordionWrapper.defaultProps = {
  allowMultipleOpen: false,
  addDivider: true,
  customClassName: "",
  customStyles: {},
};

export {AccordionWrapper,Accordion};
