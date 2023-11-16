import type {
  CategoryQueryOptions,
  NextPageWithLayout,
  ProductQueryOptions,
  SettingsQueryOptions,
} from '@/types';
import type { GetStaticProps } from 'next';
import Layout from '@/layouts/_layout';
import { useProducts } from '@/data/product';
import Grid from '@/components/product/grid';
import { useRouter } from 'next/router';
import Seo from '@/layouts/_seo';
import routes from '@/config/routes';
import client from '@/data/client';
import { dehydrate, QueryClient } from 'react-query';
import { API_ENDPOINTS } from '@/data/client/endpoints';
import CategoryFilter from '@/components/product/category-filter';
import { serverSideTranslations } from 'next-i18next/serverSideTranslations';
import Slider from './slider';
import IconDropdown from './megamenu';
import { FaHome, FaUser, FaCog, FaTractor, FaBatteryFull, FaCar, FaTshirt, FaChair, FaTable, FaApple, FaBreadSlice, FaShoppingCart, FaBuilding, FaServicestack, FaDotCircle } from "react-icons/fa";
import MainSlider from './mainslider';
import Advert from './advert';
import DemoCarousel from './slideshow';
import ReactDOM from 'react-dom';
import SponsoredProducts from './sponsored_products';
// import DemoCarousel from './DemoCarousel';

export const getStaticProps: GetStaticProps = async ({ locale }) => {
  const queryClient = new QueryClient();
  try {
    await Promise.all([
      queryClient.prefetchQuery(
        [API_ENDPOINTS.SETTINGS, { language: locale }],
        ({ queryKey }) =>
          client.settings.all(queryKey[1] as SettingsQueryOptions)
      ),
      queryClient.prefetchInfiniteQuery(
        [API_ENDPOINTS.PRODUCTS, { language: locale }],
        ({ queryKey }) =>
          client.products.all(queryKey[1] as ProductQueryOptions)
      ),
      queryClient.prefetchInfiniteQuery(
        [API_ENDPOINTS.CATEGORIES, { limit: 100, language: locale }],
        ({ queryKey }) =>
          client.categories.all(queryKey[1] as CategoryQueryOptions)
      ),
    ]);
    return {
      props: {
        ...(await serverSideTranslations(locale!, ['common'])),
        dehydratedState: JSON.parse(JSON.stringify(dehydrate(queryClient))),
      },
      revalidate: 60, // In seconds
    };
  } catch (error) {
    return {
      notFound: true,
    };
  }
};

const Home: NextPageWithLayout = () => {
  const { query } = useRouter();
  const { products, loadMore, hasNextPage, isLoadingMore, isLoading } =
    useProducts({
      ...(query.category && { categories: query.category }),
      ...(query.price && { price: query.price }),
    });

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

      {
        icon: <FaDotCircle />,
        content: "Others",
        onClick: () => {
          // Handle click event for Settings menu item
        },
        submenu: [
          {
            icon: null,
            content: "Bycicle",
            onClick: () => {
              // Handle click event for Submenu 3
            },
          },
          {
            icon: null,
            content: "Beds",
            onClick: () => {
              // Handle click event for Submenu 4
            },
          },
        ],
      },

      
    ];

    
    
  return (
    <>
      <Seo
        title="GoBoss eCommerce platform. Number 1 stop shop for enaira usage."
        description="Furnitures, Perishables, Confectionaries, Agricultural products, Fashion, Automobile spare parts"
        url={routes.home}
      />
      {/* <CategoryFilter /> */}
      {/* <IconDropdown menuItems={menuItems} fontSize="13px" /> */}
{/* <MainSlider /> */}
<DemoCarousel/>
{/* <Advert/> */}

      <Slider />
      {/* <h2>Sponsored Products</h2>  */}
      <SponsoredProducts />



      <Grid
        products={products}
        limit={30}
        onLoadMore={loadMore}
        hasNextPage={hasNextPage}
        isLoadingMore={isLoadingMore}
        isLoading={isLoading}
      />
    </>
  );
};

Home.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};

export default Home;
