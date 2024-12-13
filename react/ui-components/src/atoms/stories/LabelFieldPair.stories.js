import React from "react";
import LabelFieldPair from "../LabelFieldPair";
import TextBlock from "../TextBlock";
import TextInput from "../TextInput";

export default {
  title: "Atoms/LabelFieldPair",
  component: LabelFieldPair,
  argTypes: {
    className: {
      control: "text",
    },
    style: {
      control: { type: "object" },
    },
    vertical: {
      control: "boolean",
    },
  },
};

export const Documentation = () => (
  <iframe
    //Todo:Update the url
    src="https://core.digit.org/guides/developer-guide/ui-developer-guide/digit-ui/ui-components-standardisation/digit-ui-core-react-components/input-field" 
    width="100%"
    height="830"
    style={{ border: "none" }}
    title="Accordion Documentation"
  />
);

Documentation.storyName = "Docs";

export const Default = () => (
  <LabelFieldPair>
    <TextBlock body={"Name"}></TextBlock>
    <TextInput type="text"></TextInput>
  </LabelFieldPair>
);

export const VerticalAlignment = () => (
  <LabelFieldPair vertical={true}>
    <TextBlock body={"Name"}></TextBlock>
    <TextInput type="text"></TextInput>
  </LabelFieldPair>
);
