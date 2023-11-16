import cn from 'classnames';
import routes from '@/config/routes';
import Logo from '@/components/ui/logo';
import ActiveLink from '@/components/ui/links/active-link';
import { DiscoverIcon } from '@/components/icons/discover-icon';
import { HelpIcon } from '@/components/icons/help-icon';
import { HomeIcon } from '@/components/icons/home-icon';
import { SettingIcon } from '@/components/icons/setting-icon';
import { CloseIcon } from '@/components/icons/close-icon';
import { useDrawer } from '@/components/drawer-views/context';
import { ProductIcon } from '@/components/icons/product-icon';
import { PeopleIcon } from '@/components/icons/people-icon';
import { PaperPlaneIcon } from '@/components/icons/paper-plane-icon';
import Scrollbar from '@/components/ui/scrollbar';
import Copyright from '@/layouts/_copyright';
import { UserFollowingIcon } from '@/components/icons/user-following-icon';
import { useMe } from '@/data/user';
import { FeedIcon } from '@/components/icons/feed-icon';
import { useTranslation } from 'next-i18next';
import { BookOutlined } from '@material-ui/icons';
import { InformationIcon } from '@/components/icons/information-icon';
import { faTwitter, faInstagram, faFacebook } from '@fortawesome/free-brands-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

interface NavLinkProps {
  href: string;
  title: string;
  icon: React.ReactNode;
  isCollapse?: boolean;
}

const styles = {
  container: {
    backgroundColor: '#535357',  // Ash background color
    color: '#fff',              // White text color
    display: 'grid',
    gridTemplateColumns: 'repeat(4, 1fr)',  // Divide into four columns
    gap: '20px',
    padding: '20px',
    // borderRadius: '8px',
  },
  column: {
    padding: '10px',
    // border: '1px solid #ccc',
  },

  container2: {
    backgroundColor: '#535357',  // Ash background color
    color: '#fff',              // White text color
    // display: 'grid',
    // gridTemplateColumns: 'repeat(4, 1fr)',  // Divide into four columns
    // gap: '20px',
    // padding: '20px',
    // borderRadius: '8px',
  },
};


// function NavLink({ href, icon, title, isCollapse }: NavLinkProps) {
//   return (
//     <ActiveLink
//       href={href}
//       className="my-0.5 flex items-center gap-1 px-4 py-3 hover:bg-light-300 hover:dark:bg-dark-300 xs:px-6 sm:my-1 sm:gap-1.5 sm:px-7 lg:gap-2 xl:my-0.5"
//       activeClassName="text-dark-100 active-text-dark dark:active-text-light dark:text-light-400 font-medium bg-light-400 dark:bg-dark-400 hover:bg-light-600 hover:dark:bg-dark-500"
//     >
//       {/* <span
//         className={cn(
//           'flex flex-shrink-0 items-center justify-start',
//           isCollapse ? 'w-8 xl:w-auto' : 'w-auto xl:w-8'
//         )}
//       >
//         {icon}
//       </span>
//       <span
//         className={cn(
//           'text-dark-100 dark:text-light-400',
//           isCollapse ? 'inline-flex xl:hidden' : 'hidden xl:inline-flex'
//         )}
//       >
//         {title}
//       </span> */}
//     </ActiveLink>
//   );
// }

export function Footer2({
  isCollapse,
  className = 'hidden sm:flex fixed bottom-0 z-20 pt-[82px]',
}: {
  isCollapse?: boolean;
  className?: string;
}) {
  const { t } = useTranslation('common');

  return (
    <div style={styles.container}>
    <div style={styles.column}>
      <h2 style={{ fontWeight: "bolder"}}>NEED HELP?</h2>
      <p>Chat with us
        <br/><a href='/help'>Help Center</a>
        <br/><a href='/contact-us'>Contact Us</a></p>

    </div>
    <div style={styles.column}>
    <h2 style={{ fontWeight: "bolder"}}>ABOUT GoBoss</h2>
      <p>
        <a href='/about-us'>About Us</a><br/>
        <a href='/privacy'>Privacy Policy</a><br/>
        <a href='/terms'>Terms & Conditions</a><br/>
        <a href='/help'>FAQs</a><br/>
        Affiliate Program<br/>
        Careers<br/>
      </p>

    </div>
    <div style={styles.column}>
    <h2 style={{ fontWeight: "bolder"}}>USEFUL LINKS</h2>
      <p><a href='https://shop.goboss.com.ng/admin/register'>Sell on GoBoss</a><br/>
        Vendor Hub<br/>
        Track my Order
      </p>
    </div>
    <div style={styles.column}>
  <h2 style={{ fontWeight: "bolder"}}>CONNECT WITH US</h2>
  <div style={{ display: 'flex', alignItems: 'center' }}>
    <a href='https://facebook.com/gobossng' target='_blank'><FontAwesomeIcon icon={faFacebook} style={{ width: '20px', marginRight: '10px' }} /></a>
    <a href='https://instagram.com/gobossng' target='_blank'><FontAwesomeIcon icon={faInstagram} style={{ width: '20px', marginRight: '10px' }} /></a>
    <a href='https://twitter.com/gobossng' target='_blank'><FontAwesomeIcon icon={faTwitter} style={{ width: '20px', marginRight: '10px' }} /></a>
  </div>
</div>


    
  
<div style={{ ...styles.container2, gridColumn: '1 / span 4', padding: '20px 0' }}>
        <p style={{ textAlign: 'center' }}>
          &copy; Copyright 2023. GoBoss e-Commerce Platform. Key partner for CBN eNaira.
        </p>
      </div>


</div>



  );
}


