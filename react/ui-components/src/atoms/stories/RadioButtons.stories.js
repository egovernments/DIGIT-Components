import React, { useState, useEffect } from "react";
import { QueryClient, QueryClientProvider } from "react-query";
import { CustomDropdown } from "../../molecules";
import FieldV1 from "../../hoc/FieldV1";
import Iframe from "../Iframe";

export default {
  title: "Atoms/RadioButton",
  component: CustomDropdown,
  argTypes: {
    t: { control: false },
    populators: { control: "object" },
    inputRef: { control: false },
    label: { control: "text" },
    onChange: { action: "onChange" },
    value: { control: "text" },
    errorStyle: { control: "object" },
    disabled: { control: "boolean" },
    type: { control: "select", options: ["radio"] },
    additionalWrapperClass: { control: "text" },
    props: { control: "object" },
  },
};
const queryClient = new QueryClient();

const Template = (args) => {
  const [selectedOption, setSelectedOption] = useState(args.value);

  const handleSelectOption = (e, name) => {
    const selectedValue = e.code;
    if (selectedValue !== undefined) {
      setSelectedOption(selectedValue);
      args.onChange(e, name);
    }
  };

  return (
    <QueryClientProvider client={queryClient}>
      <FieldV1 {...args} value={selectedOption} onChange={handleSelectOption} />
    </QueryClientProvider>
  );
};

const t = (key) => key;

const gendersOptions = [
  { code: "MALE", name: "MALE" },
  { code: "FEMALE", name: "FEMALE" },
  { code: "TRANSGENDER", name: "TRANSGENDER" },
];

const commonArgs = {
  t: t,
  populators: {
    name: "gender",
    optionsKey: "name",
    options: gendersOptions,
  },
  inputRef: null,
  label: "Select Gender",
  errorStyle: null,
  disabled: false,
  type: "radio",
  additionalWrapperClass: "",
  error: "",
  description: "",
};

export const Documentation = () => (
  <Iframe
    //Todo:Update the url
    src="https://core.digit.org/guides/developer-guide/ui-developer-guide/digit-ui/ui-components-standardisation/digit-ui-core-react-components/input-field"
    title="RadioButton Documentation"
  />
);

Documentation.storyName = "Docs";

export const Default = Template.bind({});
Default.args = {
  ...commonArgs,
};

export const Disabled = Template.bind({});
Disabled.args = {
  ...commonArgs,
  disabled: true,
};
Disabled.argTypes = {
  disabled: { control: { disable: true } },
};

export const Filled = Template.bind({});
Filled.args = {
  ...commonArgs,
  value: "MALE",
};

export const PreSelected = Template.bind({});
PreSelected.args = {
  ...commonArgs,
  value: "MALE",
  disabled: true,
};
PreSelected.argTypes = {
  disabled: { control: { disable: true } },
};

export const AlignVertical = Template.bind({});
AlignVertical.args = {
  ...commonArgs,
  populators: {
    ...commonArgs.populators,
    alignVertical: true,
  },
};