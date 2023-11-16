import React, { Component } from 'react';
import Carousel from 'react-elastic-carousel';

class SponsoredProducts extends Component {
  state = {
    items: [
      { id: 1, title: 'Refrigerators', imageUrl: 'https://ng.jumia.is/cms/0-1-weekly-cps/0-2023/01-thumbnails/refreigerator.jpg', link: 'https://example.com' },
      { id: 2, title: 'Groceries', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/groceries_220x220.png', link: 'https://example.com' },
      { id: 3, title: 'Electronics', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/electronics_220x220.png', link: 'https://example.com' },
      { id: 4, title: 'Mens Sneakers', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/fashion_220x220.png', link: 'https://example.com' },
      { id: 5, title: 'Health & Beauty', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/health-beauty_220x220.png', link: 'https://example.com' },
      { id: 6, title: 'Phone & Tablets', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/phones_220x220.png', link: 'https://example.com' },
      { id: 7, title: 'Anniversary', imageUrl: 'https://ng.jumia.is/cms/0-6-anniversary/2023/designs/anniversary_220x220.png', link: 'https://example.com' },
      { id: 8, title: 'Up to 30% Off', imageUrl: 'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/clearance_220x220.png', link: 'https://example.com' },
      { id: 9, title: 'item #9', imageUrl: 'https://www.jumia.com.ng/appliances-fridges-freezers/', link: 'https://example.com' },
      { id: 10, title: 'item #10', imageUrl: 'https://www.jumia.com.ng/appliances-fridges-freezers/', link: 'https://example.com' },
      { id: 1, title: 'Refrigerators', imageUrl: 'https://ng.jumia.is/cms/0-1-weekly-cps/0-2023/01-thumbnails/refreigerator.jpg', link: 'https://example.com' },
      { id: 2, title: 'Groceries', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/groceries_220x220.png', link: 'https://example.com' },
      { id: 3, title: 'Electronics', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/electronics_220x220.png', link: 'https://example.com' },
      { id: 4, title: 'Mens Sneakers', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/fashion_220x220.png', link: 'https://example.com' },
      { id: 5, title: 'Health & Beauty', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/health-beauty_220x220.png', link: 'https://example.com' },
      { id: 6, title: 'Phone & Tablets', imageUrl: 'https://ng.jumia.is/cms/0-1-christmas-sale/2022/thumbnails/phones_220x220.png', link: 'https://example.com' },
      { id: 7, title: 'Anniversary', imageUrl: 'https://ng.jumia.is/cms/0-6-anniversary/2023/designs/anniversary_220x220.png', link: 'https://example.com' },
      { id: 8, title: 'Up to 30% Off', imageUrl: 'https://ng.jumia.is/cms/0-1-homepage/0-0-thumbnails/clearance_220x220.png', link: 'https://example.com' },
      { id: 9, title: 'item #9', imageUrl: 'https://www.jumia.com.ng/appliances-fridges-freezers/', link: 'https://example.com' },
      { id: 10, title: 'item #10', imageUrl: 'https://www.jumia.com.ng/appliances-fridges-freezers/', link: 'https://example.com' }
    ],
    itemsToShow: 8, // Default value for itemsToShow
  };

  componentDidMount() {
    // Determine the number of items to show based on screen size
    this.updateItemsToShow();
    window.addEventListener('resize', this.updateItemsToShow);
  }

  componentWillUnmount() {
    window.removeEventListener('resize', this.updateItemsToShow);
  }

  updateItemsToShow = () => {
    const isMobile = window.innerWidth <= 600;
    const itemsToShow = isMobile ? 1 : 8;
    this.setState({ itemsToShow });
  };

  handleItemHover = (itemId) => {
    this.setState((prevState) => ({
      items: prevState.items.map((item) => {
        if (item.id === itemId) {
          return { ...item, isHovered: true };
        }
        return item;
      })
    }));
  };

  handleItemLeave = (itemId) => {
    this.setState((prevState) => ({
      items: prevState.items.map((item) => {
        if (item.id === itemId) {
          return { ...item, isHovered: false };
        }
        return item;
      })
    }));
  };

  render() {
    const { items, itemsToShow } = this.state;

    const itemStyle = {
      padding: '0',
      margin: '0 5px',
      textAlign: 'center',
      boxShadow: 'none',
      border: 'none',
      marginTop: '10px', // Adjust the top margin as desired
      transition: 'transform 0.3s ease', // Transition for hover effect
      transformOrigin: 'center bottom',
      borderRadius: '4px'
    };

    const hoveredItemStyle = {
      transform: 'translateY(-5px)', // Apply transform when hovered
    };

    const imageStyle = {
      width: '100%',
      height: 'auto',
      borderRadius: '5px',
      marginBottom: '5px',
    };

    const carouselContainerStyle = {
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
      marginTop: '20px',
      background: 'white',
      paddingBottom: '8px',
      marginLeft: '18px',
      marginRight: '18px',
      height: '200px',
      overflowX: 'auto',
    };

    return (
      <div style={carouselContainerStyle}>
        <h1>Your Heading</h1> 
        
        <Carousel itemsToShow={itemsToShow} itemPadding={[0, 10]} pagination={false} showArrows={true}>
          {items.map((item) => (
            <a
              key={item.id}
              href={item.link}
              target="_blank"
              rel="noreferrer"
              style={{ textDecoration: 'none' }}
              onMouseEnter={() => this.handleItemHover(item.id)}
              onMouseLeave={() => this.handleItemLeave(item.id)}
            >
              <div style={{ ...itemStyle, ...(item.isHovered ? hoveredItemStyle : {}) }}>
                <img src={item.imageUrl} alt={item.title} style={imageStyle} />
                <div>{item.title}</div>
              </div>
            </a>
          ))}
        </Carousel>
      </div>
    );
  }
}

export default SponsoredProducts;
