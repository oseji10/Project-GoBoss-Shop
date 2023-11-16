import React, { Component } from 'react';
import Carousel from 'react-elastic-carousel';

class MainSlider extends Component {
  state = {
    items: [
      { id: 1, title: 'Refrigerators', imageUrl: 'https://ng.jumia.is/cms/0-1-cpr/2023/large-item-updated/design-update/Desktop_Homepage_Slider__712x384.png', link: 'https://example.com' },
      { id: 2, title: 'Refrigerators', imageUrl: 'https://ng.jumia.is/cms/0-6-anniversary/2023/initiatives/712x384.gif', link: 'https://example.com' },
    ],
    itemsToShow: 1, // Display one item at a time
    activeItemIndex: 0, // Index of the currently active item
  };

  carouselRef = React.createRef(); // Reference to the Carousel component

  componentDidMount() {
    // Determine the number of items to show based on screen size
    this.updateItemsToShow();
    window.addEventListener('resize', this.updateItemsToShow);

    // Start the interval to change sliders
    this.startInterval();
  }

  componentWillUnmount() {
    window.removeEventListener('resize', this.updateItemsToShow);

    // Clear the interval before unmounting the component
    clearInterval(this.interval);
  }

  updateItemsToShow = () => {
    const isMobile = window.innerWidth <= 600;
    const itemsToShow = isMobile ? 1 : 8;
    this.setState({ itemsToShow });
  };

  startInterval = () => {
    this.interval = setInterval(this.changeSlider, 5000); // Change slider every 5 seconds
  };

  changeSlider = () => {
    const { items, activeItemIndex } = this.state;
    const nextIndex = (activeItemIndex + 1) % items.length;
    this.carouselRef.current.goTo(nextIndex, true); // Go to the next slider with smooth transition
  };

  handleSliderChange = (currentItemIndex) => {
    this.setState({ activeItemIndex: currentItemIndex });
  };

  render() {
    const { items, itemsToShow, activeItemIndex } = this.state;

    const itemStyle = {
      width: '712px', // Set the width to 712px
      height: '384px', // Set the height to 384px
      margin: '0 auto',
      textAlign: 'center',
      boxShadow: 'none',
      border: 'none',
      marginTop: '10px', // Adjust the top margin as desired
      transition: 'transform 0.3s ease', // Transition for hover effect
      transformOrigin: 'center bottom',
      borderRadius: '4px',
    };

    const hoveredItemStyle = {
      transform: 'translateY(-5px)', // Apply transform when hovered
    };

    const imageStyle = {
      width: '100%',
      height: '100%',
      borderRadius: '15px',
      objectFit: 'cover', // Ensure the image fills the container without distortion
    };

    const carouselContainerStyle = {
      width: '712px',
      height: '384px',
      marginTop: '-384px',
      background: '',
      paddingBottom: '8px',
      marginLeft: '240px',
      marginRight: '0px',
    };

    return (
      <div style={carouselContainerStyle}>
        <Carousel
          ref={this.carouselRef}
          itemsToShow={itemsToShow}
          itemPadding={[0, 10]}
          pagination={true}
          showArrows={false}
          onChange={this.handleSliderChange}
          renderPagination={({ pages, activePage }) => (
            <div style={{ textAlign: 'center' }}>
              {pages.map((page) => (
                <button
                  key={page}
                  style={{
                    width: '10px',
                    height: '10px',
                    margin: '0 5px',
                    borderRadius: '50%',
                    backgroundColor: page === activePage ? 'orange' : 'gray',
                    border: 'none',
                    cursor: 'pointer',
                  }}
                />
              ))}
            </div>
          )}
        >
          {items.map((item, index) => (
            <a
              key={item.id}
              href={item.link}
              target="_blank"
              rel="noreferrer"
              style={{ textDecoration: 'none' }}
            >
              <div
                style={{
                  ...itemStyle,
                  ...(activeItemIndex === index ? hoveredItemStyle : {}),
                }}
              >
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

export default MainSlider;
