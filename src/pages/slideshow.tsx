import React, { useRef, useState } from 'react';
import { Carousel } from 'react-responsive-carousel';
import 'react-responsive-carousel/lib/styles/carousel.min.css';
import IconDropdown from './megamenu';
import { FaTractor, FaBatteryFull, FaCar, FaTshirt, FaTable, FaApple, FaBreadSlice, FaShoppingCart, FaBuilding, FaServicestack, FaDotCircle, FaBars, FaTimes } from 'react-icons/fa';
import styled from 'styled-components';
import Advert from './advert';
import { useMediaQuery } from 'react-responsive';

const MenuItem = styled.div`
  display: flex;
  align-items: center;
  margin-bottom: 10px;

  svg {
    margin-right: 8px;
  }
`;


const menuItems2 = [
  {
    icon: <FaTractor />,
    content: "Agriculture",
    onClick: () => {
      // Handle click event for Agriculture menu item
    },
    submenu: [
      {
        icon: null,
        content: "Farm implements",
        onClick: () => {
          // Handle click event for Submenu 1
        },
      },
      {
        icon: null,
        content: "Crops",
        onClick: () => {
          // Handle click event for Submenu 2
        },
      },
    ],
  },
];

const VerticalMenu = ({ menuItems2 }) => {
  return (
    <MenuWrapper>
      {menuItems2.map((menuItem2, index) => (
        <MenuItem key={index}>
          {menuItem2.icon}
          {menuItem2.content}
        </MenuItem>
      ))}
    </MenuWrapper>
  );
};

const DemoCarousel: React.FC = () => {
  const containerRef = useRef(null);
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const menuItems = [
    // {
    //   icon: <FaHome />,
    //   content: "Home",
    //   onClick: () => {
    //     // Handle click event for Home menu item
    //   },
    // },
    {
      icon: <FaTractor />,
      content: "Agriculture",
      onClick: () => {
        // Handle click event for Agriculture menu item
      },
      submenu: [
        {
          icon: null,
          content: "Farm implements",
          onClick: () => {
            // Handle click event for Submenu 1
          },
        },
        {
          icon: null,
          content: "Crops",
          onClick: () => {
            // Handle click event for Submenu 2
          },
        },
      ],
    },

    {
      icon: <FaBatteryFull />,
      content: "Electronics",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Fan",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Generator",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaCar />,
      content: "Automobile Spare Parts",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "KIA",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Honda",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
        {
          icon: null,
          content: "Toyota",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
        {
          icon: null,
          content: "Mercedes",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaTshirt />,
      content: "Fashion",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Men",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Women",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },

        {
          icon: null,
          content: "Children",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaTable />,
      content: "Furnitures",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Tables",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Chairs",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },


    {
      icon: <FaApple />,
      content: "Consumer Goods",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Garri",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Beans",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },


    {
      icon: <FaBreadSlice />,
      content: "Catering & Confectionaries",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Bread",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Chocolates",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaShoppingCart />,
      content: "Village Markets",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Wuse Market",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Garki Market",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },

        {
          icon: null,
          content: "Nyanya Market",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },

        {
          icon: null,
          content: "Jabi Market",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaBuilding />,
      content: "Building Materials",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Ladder",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Roofing sheet",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },

    {
      icon: <FaServicestack />,
      content: "Services",
      onClick: () => {
        // Handle click event for Settings menu item
      },
      submenu: [
        {
          icon: null,
          content: "Professionals",
          onClick: () => {
            // Handle click event for Submenu 3
          },
        },
        {
          icon: null,
          content: "Artisans",
          onClick: () => {
            // Handle click event for Submenu 4
          },
        },
      ],
    },
  ];

  const isSmallScreen = useMediaQuery({ query: '(max-width: 768px)' });
  const imageUrl1 = '/image/Goboss_Ad.png';


  
  return (
    <Container>
      <HamburgerButton onClick={() => setIsMenuOpen(true)}>
        <FaBars />
      </HamburgerButton>
      <ContentContainer>
      {!isSmallScreen && <VerticalMenu menuItems2={menuItems2} />}
        <MenuWrapper isOpen={isMenuOpen}>
          <CloseButton onClick={() => setIsMenuOpen(false)}>
            <FaTimes />
          </CloseButton>
          <IconDropdown menuItems={menuItems} fontSize="13px" />
        </MenuWrapper>
        <CarouselContainer>
          <Carousel showThumbs={false} autoPlay={true}>
            {/* <div>
              <img src="https://ng.jumia.is/cms/0-1-cpr/2023/large-item-updated/design-update/Desktop_Homepage_Slider__712x384.png" alt="Carousel Image 1" />
            </div> */}
            <div>
              <img src="/image/Goboss_Gif_2.gif" alt="Carousel Image 2" />
            </div>
          </Carousel>
        </CarouselContainer>
        {/* Conditionally render the Image Placeholder */}
        {!isSmallScreen && <ImagePlaceholder src={imageUrl1} alt="Carousel Image 1" />}
      </ContentContainer>
{/* <Advert/> */}
    </Container>

);
};

const Container = styled.div`
  display: flex;
  flex-direction: column;
  margin-top: 5px;
  
`;

const HamburgerButton = styled.button`
  display: none;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 18px;

  @media (max-width: 768px) {
    display: block;
  }
`;

const ContentContainer = styled.div`
  display: flex;
  flex-direction: row;
  align-items: stretch; /* Update align-items property */
  justify-content: flex-start;

  /* Remove the height property to allow the container to adjust its height based on content */
`;



const MenuWrapper = styled.div`
  display: ${({ isOpen }) => (isOpen ? 'flex' : 'none')};
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  position: absolute;
  background-color: white;
  top: 35px;
  left: 0;
  padding: 10px;
  z-index: 9999;
  width: 100%;
  max-height: calc(100vh - 35px);
  overflow-y: auto;

  @media (max-width: 768px) {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    width: 100%;
    padding: 10px;
    z-index: 9999;
    overflow-y: auto;
  }
`;

const CloseButton = styled.button`
  background: none;
  border: none;
  cursor: pointer;
  font-size: 20px;
  margin-bottom: 5px;
`;


const CarouselContainer = styled.div`
  flex: 1; /* Expand to fill the available space within ContentContainer */
  max-width: 912px;
  margin: 0 18px; /* Adjust the margins as needed */
  overflow: hidden; /* Hide any content that overflows the container */
  display: flex; /* Set the CarouselContainer as a flex container */
  flex-direction: column; /* Ensure carousel content is stacked vertically */
  align-items: center; /* Center the content horizontally */

  /* Remove the height styles to let the container adjust its height based on content */

  /* Adjust the position of the carousel content within the container */
  .carousel-root {
    flex: 1; /* Fill the available vertical space within the container */
  }
`;



const CenteredSlider = styled.div`
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  height:100px;
`;


const ImagePlaceholder = styled.img`
  width: 470px;
  height: 384;
  max-height: 384%;
  background-color: #f1f1f1; /* Placeholder background color */
  margin-left: -10px; /* Adjust the margin as needed */
  margin-right: 10px;
`;

export default DemoCarousel;

