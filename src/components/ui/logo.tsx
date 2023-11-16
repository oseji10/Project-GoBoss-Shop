import cn from 'classnames';
import Image from '@/components/ui/image';
import AnchorLink from '@/components/ui/links/anchor-link';
import routes from '@/config/routes';
import { useIsMounted } from '@/lib/hooks/use-is-mounted';
import { useIsDarkMode } from '@/lib/hooks/use-is-dark-mode';
import { siteSettings } from '@/data/static/site-settings';
import { useSettings } from '@/data/settings';

export default function Logo({
  className = 'w-20',
  ...props
}: React.AnchorHTMLAttributes<{}>) {
  const isMounted = useIsMounted();
  const { isDarkMode } = useIsDarkMode();
  const { lightLogo, darkLogo } = siteSettings;
  const { settings }: any = useSettings();
  return (
    <AnchorLink
      href={routes.home}
      className={cn(
        'relative flex items-center text-dark focus:outline-none dark:text-light',
        className
      )}
      {...props}
    >
      <span
      
        className="relative "
        // className="relative overflow-hidden"
        style={{
          width: 270,
          height: 100,
          display: 'flex', alignItems: 'center', 
        }}
      >
        {isMounted && isDarkMode && (
   <Image
   src={settings?.dark_logo?.original ?? darkLogo}
   layout="responsive" // Use "responsive" layout to maintain aspect ratio and adjust size
   width={500} // Set the desired width of the image
   height={300} // Set the desired height of the image
   objectFit="contain" // Adjust the object fit style as needed
   loading="eager"
   alt={settings?.siteTitle ?? 'GoBoss Logo Dark'}
 />
 
        )}
        {isMounted && !isDarkMode && (
          // <Image
          //   src={settings?.logo?.original ?? lightLogo}
          //   layout="fill"
          //   objectFit="contain"
          //   loading="eager"
          //   alt={settings?.siteTitle ?? 'GoBoss Logo Ligt'}
          // />
          <Image
          src = {'/image/logo.jpeg'}
          // src={logo?.original ?? siteSettings.logo.url}
          alt={settings?.siteTitle ?? 'GoBoss Logo Light'}
          layout="fixed"
          objectFit="contain"
          loading="eager"
          width={150} // Set the desired width of the image
          height={60}// Set the desired height of the image
          // quality={20}
        />

        
        )}
      </span>
    </AnchorLink>
  );
}
