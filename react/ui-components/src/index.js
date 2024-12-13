import {
  Accordion,
  AccordionWrapper,
  ActionBar,
  ActionLinks,
  Amount,
  AppContainer,
  BackLink,
  Sidebar,
  MobileSidebar,
  Switch,
  Tooltip,
  Banner,
  BodyContainer,
  BreadCrumb,
  BreakLine,
  Button,
  Card,
  CardBasedOptions,
  CardCaption,
  CardHeader,
  CardLabel,
  CardLabelError,
  CardText,
  CheckBox,
  CitizenHomeCard,
  CitizenInfoLabel,
  CollapseAndExpandGroups,
  ConnectingCheckPoints,
  DatePicker,
  DisplayPhotos,
  Dropdown,
  ErrorMessage,
  Footer,
  Header,
  HeaderBar,
  HorizontalNav,
  Tab,
  InfoCard,
  PageBasedInput,
  InputTextAmount,
  KeyNote,
  LabelFieldPair,
  Loader,
  LoaderScreen,
  MobileNumber,
  MultiSelectDropdown,
  NoResultsFound,
  OTPInput,
  SlideOverMenu,
  Paragraph,
  PlusMinusInput,
  PopUp,
  PrivateRoute,
  RadioButtons,
  Rating,
  Chip,
  SVG,
  // Table,
  Telephone,
  TextArea,
  TextInput,
  Toast,
  UploadFile,
  WhatsNewCard,
  Toggle,
  ToggleSwitch,
  TreeSelect,
  SubmitBar,
  ButtonSelector,
  InboxSearchLinks,
  SearchComponent,
  LinkLabel,
  RoundedLabel,
  Stepper,
  Timeline,
  StringManipulator,
  InfoButton,
  Uploader,
  UploadPopup,
  UploadImage,
  ErrorBoundary,
  TextBlock,
  Panels,
  Animation,
  ViewCardFieldPair,
  Divider,
  ButtonGroup,
  TopBar,
  Hamburger,
  Menu,
  SelectionCard,
  Tag,
  CustomSVG,
  TableMain,
  TableHeader,
  TableFooter,
  TableBody,
  TableRow,
  TableCell,
  NestedTable,
  LoaderComponent,
  Iframe
} from "./atoms";

import { FieldComposer, FieldController, Fields, FormComposerV2, Modal, UploadFileComposer, FieldV1, InboxSearchComposer, ResultsTable } from "./hoc";

import {
  ApiDropdown,
  CustomDropdown,
  BottomSheet,
  DetailsCard,
  FormStep,
  InputCard,
  LocationDropdownWrapper,
  MultiUploadWrapper,
  SearchAction,
  SearchForm,
  SearchField,
  SearchOnRadioButtons,
  TextInputCard,
  PanelCard,
  TooltipWrapper,
  TimelineMolecule,
  LandingPageCard,
  MenuCard,
  LandingPageWrapper,
  MenuCardWrapper,
  TableMolecule,
  MetricCard,
  FormCard,
  FilterCard,
  ViewCard
} from "./molecules";

// import { initCoreLibraries } from "@egovernments/digit-ui-libraries-core";
import { initLibraries } from "@egovernments/digit-ui-libraries";

initLibraries().then(() => {
  console.info("DIGIT Contants enabled");
});

export {
  ActionBar,
  ActionLinks,
  Amount,
  AppContainer,
  BackLink,
  Sidebar,
  MobileSidebar,
  Accordion,
  Iframe,
  AccordionWrapper,
  Switch,
  Tooltip,
  Banner,
  BodyContainer,
  BreadCrumb,
  BreakLine,
  Button,
  SelectionCard,
  Tag,
  Card,
  CardBasedOptions,
  CardCaption,
  CardHeader,
  CardLabel,
  CardLabelError,
  CardText,
  CheckBox,
  PageBasedInput,
  CitizenHomeCard,
  CitizenInfoLabel,
  CollapseAndExpandGroups,
  ConnectingCheckPoints,
  DatePicker,
  DisplayPhotos,
  Dropdown,
  ErrorMessage,
  Footer,
  Header,
  HeaderBar,
  HorizontalNav,
  LoaderComponent,
  Tab,
  InfoCard,
  InputTextAmount,
  SearchField,
  KeyNote,
  LabelFieldPair,
  Loader,
  LoaderScreen,
  MobileNumber,
  MultiSelectDropdown,
  NoResultsFound,
  OTPInput,
  SlideOverMenu,
  Paragraph,
  PlusMinusInput,
  PopUp,
  PrivateRoute,
  RadioButtons,
  Rating,
  Chip,
  SVG,
  // Table,
  Telephone,
  TextArea,
  TextInput,
  Toast,
  UploadFile,
  WhatsNewCard,
  FieldComposer,
  FieldV1,
  FieldController,
  Fields,
  FormComposerV2,
  Modal,
  UploadFileComposer,
  ApiDropdown,
  CustomDropdown,
  BottomSheet,
  DetailsCard,
  FormStep,
  InputCard,
  LocationDropdownWrapper,
  MultiUploadWrapper,
  SearchAction,
  SearchForm,
  LandingPageCard,
  MetricCard,
  FormCard,
  FilterCard,
  ViewCard,
  TableMolecule,
  MenuCard,
  MenuCardWrapper,
  LandingPageWrapper,
  SearchOnRadioButtons,
  TextInputCard,
  PanelCard,
  TimelineMolecule,
  TooltipWrapper,
  Toggle,
  ToggleSwitch,
  TreeSelect,
  SubmitBar,
  ButtonSelector,
  TopBar,
  Hamburger,
  Menu,
  Stepper,
  Timeline,
  StringManipulator,
  InfoButton,
  Uploader,
  UploadPopup,
  UploadImage,
  TextBlock,
  Panels,
  ViewCardFieldPair,
  ButtonGroup,
  Divider,
  Animation,
  InboxSearchLinks,
  SearchComponent,
  InboxSearchComposer,
  ResultsTable,
  LinkLabel,
  RoundedLabel,
  //Icons
  CustomSVG,
  ErrorBoundary,
  TableMain,
  TableHeader,
  TableFooter,
  TableBody,
  TableRow,
  TableCell,
  NestedTable
};