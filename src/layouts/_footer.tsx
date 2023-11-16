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
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faWhatsapp } from '@fortawesome/free-brands-svg-icons';
import { faPhone } from '@fortawesome/free-solid-svg-icons';
import { faEnvelope } from '@fortawesome/free-solid-svg-icons';



interface NavLinkProps {
  href: string;
  title: string;
  icon: React.ReactNode;
  isCollapse?: boolean;
}

const styles = {
  container: {
    backgroundColor: '#313133',  // Ash background color
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
  icon: {
    fontSize: '10px', // Adjust the font size for a smaller icon
    color: '#25D366',  // WhatsApp color
  },
};




export function Footer({
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
    <img src="image/logo.png" alt="Column 1 Image" style={{ maxWidth: '60%' }} />
    </div>
    <div style={styles.column}>
  <h2> PHONE SUPPORT</h2>
  <div style={{ display: 'flex', alignItems: 'center' }}>
    <FontAwesomeIcon icon={faPhone}  style={{width: "20px"}}/>
    <p style={{ marginLeft: '10px' }}><a href='tel:08038506974'>+234 803 850 6974</a></p>
  </div>
</div>
<div style={styles.column}>
  <h2> WHATSAPP</h2>
  <div style={{ display: 'flex', alignItems: 'center' }}>
    <FontAwesomeIcon icon={faWhatsapp}  style={{width: "20px"}}/>
    <p style={{ marginLeft: '10px' }}><a href='https://wa.me/08038506974' target='_blank'>+234 803 850 6974</a></p>
  </div>
</div>
<div>
<h2> EMAIL</h2>
  <div style={{ display: 'flex', alignItems: 'center' }}>
    <FontAwesomeIcon icon={faEnvelope}  style={{width: "20px"}}/>
    <p style={{ marginLeft: '10px' }}><a href='mailto:help@goboss.com.ng'>help@goboss.com.ng</a></p>
  </div>
</div>
  </div>
  );
}


