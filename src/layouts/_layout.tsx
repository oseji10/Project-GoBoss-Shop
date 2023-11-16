import { useState } from 'react';
import dynamic from 'next/dynamic';
import cn from 'classnames';
import { motion } from 'framer-motion';
import Header from '@/layouts/_header';
import { Sidebar } from '@/layouts/_layout-sidebar';
import { useBreakpoint } from '@/lib/hooks/use-breakpoint';
import { useIsMounted } from '@/lib/hooks/use-is-mounted';
import { Footer } from './_footer';
import { Footer2 } from './_footer2';
import IconDropdown from '../pages/megamenu';

const BottomNavigation = dynamic(() => import('@/layouts/_bottom-navigation'), {
  ssr: false,
});

export default function Layout({ children }: React.PropsWithChildren<{}>) {
  const breakpoint = useBreakpoint();
  const isMounted = useIsMounted();
  let [collapse, setCollapse] = useState(false);
  function toggleSidebar() {
    setCollapse((prev) => !prev);
  }
  return (
    <motion.div
      initial="exit"
      animate="enter"
      exit="exit"
      className="flex min-h-screen w-full flex-col bg-light-300 dark:bg-dark-100"
    >
      <Header
        isCollapse={collapse}
        showHamburger={true}
        onClickHamburger={toggleSidebar}
      />
      <div className="flex flex-1">
        <Sidebar isCollapse={collapse} />
        {/* <IconDropdown/> */}
        
        <main
          className={cn(
            'flex w-full flex-col',
            collapse
              ? 'ltr:sm:pl-60 rtl:sm:pr-60 ltr:xl:pl-[75px] rtl:xl:pr-[75px]'
              : 'ltr:sm:pl-[75px] rtl:sm:pr-[75px] ltr:xl:pl-60 rtl:xl:pr-60'
          )}
        >
          {children}
          <Footer isCollapse={collapse} />
          <Footer2 isCollapse={collapse} />
        </main>
      </div>
      {isMounted && breakpoint === 'xs' && <BottomNavigation />}
    </motion.div>
  );
}
