import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { SVG } from "./SVG";

const TextInput = (props) => {
  const user_type = window?.Digit?.SessionStorage.get("userType");
  const [date, setDate] = useState(props?.type === "date" && props?.value);
  const [visibility, setVisibility] = useState(false);
  const data = props?.watch
    ? {
        fromDate: props?.watch("fromDate"),
        toDate: props?.watch("toDate"),
      }
    : {};

  const handleDate = (event) => {
    const { value } = event.target;
    setDate(getDDMMYYYY(value));
  };
  

  const incrementCount = () => {
    const newValue = Number(props.value) + 1;
    props.onChange({ target: { value: newValue, type: props.type} });
  };

  const decrementCount = () => {
    const newValue = Math.max(Number(props.value) - 1, 0);
    props.onChange({ target: { value: newValue, type: props.type} });
  };

  const renderPrefix = () => {
    const prefixValue = props?.populators?.prefix || "";
    if (props?.type === "numeric") {
      return (
        <button type="button" onClick={() => decrementCount()} className="digit-numeric-button-prefix">
          -
        </button>
      );
    }
    if (prefixValue) {
      return <button className="digit-prefix">{prefixValue}</button>;
    }
    return null;
  };

  const renderSuffix = () => {
    const suffixValue = props?.populators?.suffix || "";
    if (props?.type === "numeric") {
      return (
        <button type="button" onClick={() => incrementCount()} className="digit-numeric-button-suffix">
          +
        </button>
      );
    }
    if (suffixValue) {
      return <button className="digit-suffix">{suffixValue}</button>;
    }
    return null;
  };

  const handleVisibility = () => {
    setVisibility(!visibility);
    const newType = !visibility ? "text" : "password";
    props.onChange({ target: { type: newType, value: props.value } });
  };

  const handleLocationClick = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          props.onChange({
            target: {
              value: `${latitude}, ${longitude}`,
              type: "geolocation",
            },
          });
        },
        (error) => {
          console.error("Error getting location:", error);
        }
      );
    } else {
      console.error("Geolocation is not supported");
    }
  };

  const renderIcon = () => {
    const customIcon = props?.type;
    const iconFill = props?.disabled ? "#D6D5D4" : props?.nonEditable ? "#b1b4b6" : "#505A5F";
    if (customIcon) {
      if (customIcon === "geolocation") {
        return <SVG.MyLocation fill={iconFill} onClick={handleLocationClick} className="digit-text-input-customIcon" />;
      } else if (customIcon === "text" && visibility) {
        return <SVG.VisibilityOff fill={iconFill} onClick={handleVisibility} className="digit-text-input-customIcon" />;
      } else if (customIcon === "password") {
        return <SVG.Visibility fill={iconFill} onClick={handleVisibility} className="digit-text-input-customIcon" />;
      } else if (customIcon === "search") {
        return <SVG.Search fill={iconFill} className="digit-text-input-customIcon" />;
      } else {
        try {
          const DynamicIcon = require("@egovernments/digit-ui-react-components")?.[props?.populators?.customIcon];
          if (DynamicIcon) {
            return <DynamicIcon fill={iconFill} className="digit-text-input-customIcon" />;
          }
        } catch (error) {
          console.error("Icon not found");
        }
      }
    }
    return null;
  };

  const icon = renderIcon();

  const inputClassNameForMandatory = `${user_type ? "digit-employee-card-input-error" : "digit-card-input-error"} ${
    props.disabled ? "disabled" : ""
  } ${props.customClass || ""} ${props.nonEditable ? "noneditable" : ""}  ${props.type === "numeric" ? "numeric" : ""}`;

  const inputClassName = `${user_type ? "digit-employee-card-input" : "digit-citizen-card-input"} ${props.disabled ? "disabled" : ""} focus-visible ${
    props.errorStyle ? "digit-employee-card-input-error" : ""
  } ${props.nonEditable ? "noneditable" : ""} ${props.type === "numeric" ? "numeric" : ""}`;

  return (
    <React.Fragment>
      <div
        className={`digit-text-input ${user_type === "employee" ? "" : "digit-text-input-width"} ${props?.className ? props?.className : ""} ${
          props.disabled ? "disabled" : ""
        }  ${props.nonEditable ? "noneditable" : ""} ${props.error ? "error" : ""} ${props.type === "numeric" ? "numeric" : ""}`}
        style={props?.textInputStyle ? { ...props.textInputStyle } : {}}
      >
        {props.required ? (
          <div className="input-container">
            {renderPrefix()}
            <input
              type={props?.validation && props.ValidationRequired ? props?.validation?.type : props.type || "text"}
              name={props.name}
              id={props.id}
              className={inputClassNameForMandatory}
              placeholder={props.placeholder}
              onChange={(event) => {
                if (props?.type === "number" && props?.maxlength) {
                  if (event.target.value.length > props?.maxlength) {
                    event.target.value = event.target.value.slice(0, -1);
                  }
                }
                if (props?.onChange) {
                  props?.onChange(event);
                }
                if (props.type === "date") {
                  handleDate(event);
                }
              }}
              ref={props.inputRef}
              value={props?.value}
              style={{ ...props.style }}
              defaultValue={props.defaultValue}
              minLength={props.minlength}
              maxLength={props.maxlength}
              max={props.max}
              pattern={props?.validation && props.ValidationRequired ? props?.validation?.pattern : props.pattern}
              min={props.min}
              readOnly={props.disabled}
              title={props?.validation && props.ValidationRequired ? props?.validation?.title : props.title}
              step={props.step}
              autoFocus={props.autoFocus}
              onBlur={props.onBlur}
              autoComplete="off"
              disabled={props.disabled}
              onFocus={props?.onFocus}
              nonEditable={props.nonEditable}
              config={props.config}
              populators={props.populators}
            />
            {renderSuffix()}
            {props.signature && props.signatureImg}
            {icon && (
              <span className="digit-cursor-pointer" onClick={props?.onIconSelection}>
                {icon}
              </span>
            )}
          </div>

        ) : (
          <div className="input-container">
            {renderPrefix()}
            <input
              type={props?.validation && props.ValidationRequired ? props?.validation?.type : props.type || "text"}
              name={props.name}
              id={props.id}
              className={inputClassName}
              placeholder={props.placeholder}
              onChange={(event) => {
                if (props?.type === "number" && props?.maxlength) {
                  if (event.target.value.length > props?.maxlength) {
                    event.target.value = event.target.value.slice(0, -1);
                  }
                }
                if (props?.onChange) {
                  props?.onChange(event);
                }
                if (props.type === "date") {
                  handleDate(event);
                }
              }}
              ref={props.inputRef}
              value={props?.value}
              style={{ ...props.style }}
              defaultValue={props.defaultValue}
              minLength={props.minlength}
              maxLength={props.maxlength}
              max={props.max}
              required={
                props?.validation && props.ValidationRequired
                  ? props?.validation?.isRequired
                  : props.isRequired || (props.type === "date" && (props.name === "fromDate" ? data.toDate : data.fromDate))
              }
              pattern={props?.validation && props.ValidationRequired ? props?.validation?.pattern : props.pattern}
              min={props.min}
              readOnly={props.disabled}
              title={props?.validation && props.ValidationRequired ? props?.validation?.title : props.title}
              step={props.step}
              autoFocus={props.autoFocus}
              onBlur={props.onBlur}
              onKeyPress={props.onKeyPress}
              autoComplete="off"
              disabled={props.disabled}
              onFocus={props?.onFocus}
              nonEditable={props.nonEditable}
              config={props.config}
              populators={props.populators}
            />
            {renderSuffix()}
            {props.signature && props.signatureImg}
            {icon && (
              <span className="digit-cursor-pointer" onClick={props?.onIconSelection}>
                {icon}
              </span>
            )}
          </div>
        )}
        {/* {props.type === "date" && <DatePicker {...props} date={date} setDate={setDate} data={data} />} */}
      </div>
    </React.Fragment>
  );
};

TextInput.propTypes = {
  userType: PropTypes.string,
  required: PropTypes.bool,
  name: PropTypes.string.isRequired,
  placeholder: PropTypes.string,
  onChange: PropTypes.func,
  inputRef: PropTypes.oneOfType([PropTypes.func, PropTypes.shape({ current: PropTypes.instanceOf(Element) })]),
  value: PropTypes.any,
  className: PropTypes.string,
  style: PropTypes.object,
  maxLength: PropTypes.number,
  minlength: PropTypes.number,
  max: PropTypes.number,
  pattern: PropTypes.string,
  min: PropTypes.number,
  disabled: PropTypes.bool,
  nonEditable: PropTypes.bool,
  errorStyle: PropTypes.bool,
  hideSpan: PropTypes.bool,
  title: PropTypes.string,
  step: PropTypes.string,
  autoFocus: PropTypes.bool,
  onBlur: PropTypes.func,
  onKeyPress: PropTypes.func,
  textInputStyle: PropTypes.object,
  defaultValue: PropTypes.any,
  customClass: PropTypes.string,
  signature: PropTypes.bool,
  signatureImg: PropTypes.node,
  onIconSelection: PropTypes.func,
  type: PropTypes.string,
  watch: PropTypes.func,
  onFocus: PropTypes.func,
  charCount: PropTypes.bool,
  errors: PropTypes.object,
  config: PropTypes.object,
  error: PropTypes.string,
};

TextInput.defaultProps = {
  required: false,
  charCount: false
};

function DatePicker(props) {
  useEffect(() => {
    if (props?.shouldUpdate) {
      props?.setDate(getDDMMYYYY(props?.data[props.name], "yyyymmdd"));
    }
  }, [props?.data]);

  useEffect(() => {
    props.setDate(getDDMMYYYY(props?.defaultValue));
  }, []);

  return (
    <input
      type="text"
      className={`${props.disabled && "disabled"} digit-card-date-input`}
      name={props.name}
      id={props.id}
      placeholder={props.placeholder}
      defaultValue={props.date}
      readOnly={true}
    />
  );
}

function getDDMMYYYY(date) {
  if (!date) return "";

  return new Date(date).toLocaleString("en-In").split(",")[0];
}

export default TextInput;
