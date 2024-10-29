import React from "react";
import { BrowserRouter as Router } from "react-router-dom";
import MobileSidebar from "../../atoms/MobileSidebar";


export default {
  title: "Molecules/Hamburger/Dark",
  component: MobileSidebar,
  argTypes: {
    items: { control: "object" },
    usermanuals: { control: "object" },
    theme: { control: "select", options: ["dark", "light"] },
    variant: { control: "select", options: ["primary", "secondary"] },
    transitionDuration: { control: "number" },
    isSearchable:{control:"boolean"},
    hideUserManuals:{control:"boolean"},
    userManualLabel:{control:"text"},
    profile:{control:"text"},
    onSelect:{ action: "onChange" },
    onLogout:{action:"onChange"},
    reopenOnLogout:{control:"boolean"},
    closeOnClickOutside:{control:"boolean"},
    onOutsideClick:{action:"onChange"}
  },
};

const Template = (args) => (
  <Router>
    <MobileSidebar {...args} />
  </Router>
);

const darkThemeItems = [
  {
    label: "City",
    isSearchable:false,
    icon:"Home",
    children: [
      {
        path: "/",
        label: "City 1",
        icon: "",
      },
      {
        path: "/",
        label: "City 2",
        icon: "",
      },
    ],
  },
  {
    label: "Language",
    isSearchable:false,
    icon: "DriveFileMove",
    children: [
      {
        path: "/",
        label: "Language 1",
        icon: "",
      },
      {
        path: "/",
        label: "Language 2",
        icon: "",
      },
    ],
  },
  {
    label: "SideNav",
    isSearchable:true,
    icon: "Accessibility",
    children: [
      {
        path: "/",
        label: "SubModule 1",
        icon: "",
        children: [
          {
            path: "/",
            label: "InnerModule 1",
            icon: "",
          },
          {
            path: "/",
            label: "InnerModule 2",
            icon: "",
          },
        ],
      },
      {
        path: "/",
        label: "SubModule 2",
        icon: "",
      },
    ],
  },
];

const exampleusermanuals = [
  {
    label:"Example1",
    icon:"Help"
  },
  {
    label:"Example2",
    icon:"Settings"
  }
]

const onSelect = (e) => {
  console.log(e,"event")
}

const onLogout = () => {
  console.log("clicked on Logout")
}

const commonArgs = {
  items: darkThemeItems,
  transitionDuration: 0.3,
  theme: "dark",
  profileName:"ProfileName",
  profileNumber:'+258 6387387',
  isSearchable:true,
  hideUserManuals:false,
  userManualLabel:"UserManual",
  profile:"",
  usermanuals:[],
  onSelect:onSelect,
  onLogout:onLogout,
  reopenOnLogout:false,
  closeOnClickOutside:false
};

export const Basic = Template.bind({});
Basic.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
};

export const WithProfile = Template.bind({});
WithProfile.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
  profile:"https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_male_user-512.png"
};

export const WithCloseOnClickOutside = Template.bind({});
WithCloseOnClickOutside.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
  closeOnClickOutside:true
};

export const WithOnOutsideClickLogic = Template.bind({});
WithOnOutsideClickLogic.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
  closeOnClickOutside:false,
  onOutsideClick:(e)=>{console.log(e)}
};

export const WithoutUsermanuals = Template.bind({});
WithoutUsermanuals.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
  hideUserManuals:true
};

export const WithCustomUsermanuals = Template.bind({});
WithCustomUsermanuals.args = {
  ...commonArgs,
  theme: "dark",
  items: darkThemeItems,
  usermanuals:exampleusermanuals
};