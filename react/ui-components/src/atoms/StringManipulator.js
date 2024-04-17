import React from "react";
import PropTypes from "prop-types";

const StringManipulator = (functionName, key, props) => {
 


  const isStringManipulated=window?.globalConfigs?.getConfig("isStringManipulated")|| false;
  if(!isStringManipulated){
    return key;
  }
  const manipulateString = () => {
    if (!key) return null;

    switch (functionName) {
      case "toSentenceCase":
        return toSentenceCase(key);
      case "capitalizeFirstLetter":
        return capitalizeFirstLetter(key);
      case "toTitleCase":
        return toTitleCase(key);
      case "truncateString":
        return truncateString(key, props?.maxLength);
      default:
        return key;
    }
  };

  const toSentenceCase = (str) => {
    return str.toLowerCase().replace(/(^\s*\w|[\.\!\?]\s*\w)/g, (c) => {
      return c.toUpperCase();
    });
  };

  const capitalizeFirstLetter = (str) => {
    return str.replace(/\b\w/g, char => char.toUpperCase());
  };

  const toTitleCase = (str) => {
    return str.toLowerCase().replace(/\b\w|\b[^a-zA-Z0-9\s]*\w/g, (c) => {
      return c.toUpperCase();
    });
  };

  const truncateString = (str, maxLength) => {
    if (str.length > maxLength) {
      return str.slice(0, maxLength) + "...";
    }
    return str;
  };

  return manipulateString();
};

StringManipulator.propTypes = {
  functionName: PropTypes.string, 
  key: PropTypes.string,
  props: PropTypes.object,
};

export default StringManipulator;
