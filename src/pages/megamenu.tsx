import React, { useState, useRef, useEffect } from "react";
import styled from "styled-components";
import { MenuItem, MenuList } from "@material-ui/core";
import { createStyles, withStyles } from "@material-ui/core/styles";
import PropTypes from "prop-types";

const styles = createStyles({
  menuText: {
    fontSize: (props) => props.fontSize || "14px",
  },
});

function IconDropdown({ menuItems, classes, fontSize }) {
  const [openSubMenuIndex, setOpenSubMenuIndex] = useState(null);
  const [hoverSubMenuIndex, setHoverSubMenuIndex] = useState(null);
  const submenuRef = useRef(null);

  const handleMouseEnter = (index) => {
    if (openSubMenuIndex !== index) {
      setOpenSubMenuIndex(index);
    }
  };

  const handleClickOutside = (event) => {
    if (submenuRef.current && !submenuRef.current.contains(event.target)) {
      setOpenSubMenuIndex(null);
    }
  };

  useEffect(() => {
    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  if (!Array.isArray(menuItems)) {
    console.error("menuItems must be an array");
    return null;
  }

  return (
    <DropdownContainer>
      <MenuListStyled>
        {menuItems.map((item, i) => {
          if (!item || typeof item !== "object" || typeof item.content === "undefined" || typeof item.onClick !== "function") {
            console.error(`Invalid menu item at index ${i}`);
            return null;
          }

          return (
            <MenuItemStyled
              key={`menu-item-${i}`}
              onClick={item.onClick}
              classes={{ root: classes.menuItem }}
              fontSize={fontSize}
              onMouseEnter={() => handleMouseEnter(i)}
              onMouseLeave={() => setHoverSubMenuIndex(null)}
            >
              {item.icon && <ListItemIconStyled>{item.icon}</ListItemIconStyled>}
              {item.content}
            </MenuItemStyled>
          );
        })}
      </MenuListStyled>
      {menuItems.map((item, i) => {
        if (!item || typeof item !== "object" || !Array.isArray(item.submenu)) {
          return null;
        }

        return (
          <SubMenuContainer
            key={`submenu-container-${i}`}
            ref={submenuRef}
            visible={openSubMenuIndex === i || hoverSubMenuIndex === i}
            onMouseEnter={() => setHoverSubMenuIndex(i)}
            onMouseLeave={() => setHoverSubMenuIndex(null)}
          >
            <SubMenuList>
              {item.submenu.map((subItem, j) => {
                if (!subItem || typeof subItem !== "object" || typeof subItem.content === "undefined" || typeof subItem.onClick !== "function") {
                  console.error(`Invalid submenu item at index ${j} of menu item at index ${i}`);
                  return null;
                }

                return (
                  <MenuItemStyled
                    key={`submenu-item-${j}`}
                    onClick={subItem.onClick}
                    classes={{ root: classes.menuItem }}
                    fontSize={fontSize}
                  >
                    {subItem.icon && <ListItemIconStyled>{subItem.icon}</ListItemIconStyled>}
                    {subItem.content}
                  </MenuItemStyled>
                );
              })}
            </SubMenuList>
          </SubMenuContainer>
        );
      })}
    </DropdownContainer>
  );
}

const DropdownContainer = styled.div`
  position: relative;
  display: inline-block;
  margin-right: 0;
  z-index: 2;
  left: 28px;
  top: 10px;
  width: fit-content;
`;

const MenuListStyled = styled(MenuList)`
  background-color: white !important;
  width: 206px;
  height: 384px;
`;

const SubMenuContainer = styled.div`
  position: absolute;
  top: 0;
  left: 208px;
  right: 0;
  display: ${(props) => (props.visible ? "block" : "none")};
`;

const SubMenuList = styled(MenuList)`
  background-color: white !important;
  padding-left: 16px;
  padding-right: 16px;
  width: 712px;
  height: 384px !important;
`;

const MenuItemStyled = styled(MenuItem)`
  && {
    font-size: ${(props) => props.fontSize || "14px"};
    color: initial;
    &:hover {
      color: orange;
      background-color: white !important;
    }
  }
`;

const ListItemIconStyled = styled.div`
  margin-right: 10px;
  background-color: white !important;
`;

IconDropdown.propTypes = {
  menuItems: PropTypes.arrayOf(
    PropTypes.shape({
      icon: PropTypes.node,
      content: PropTypes.node.isRequired,
      onClick: PropTypes.func.isRequired,
      submenu: PropTypes.arrayOf(
        PropTypes.shape({
          icon: PropTypes.node,
          content: PropTypes.node.isRequired,
          onClick: PropTypes.func.isRequired,
        })
      ),
    })
  ).isRequired,
  classes: PropTypes.object.isRequired,
  fontSize: PropTypes.string,
};

export default withStyles(styles)(IconDropdown);
