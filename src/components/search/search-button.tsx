import Button from '@/components/ui/button';
import { SearchIcon } from '@/components/icons/search-icon';
import { useSearch } from '@/components/search/search-view';
import LongSearch from './long-search';
import { useMediaQuery } from 'react-responsive';

export default function SearchButton({
  className = 'flex',
}: {
  className?: string;
}) {
  const { openSearch } = useSearch();

  const isSmallScreen = useMediaQuery({ query: '(max-width: 768px)' });

  return (
    <Button
      variant="icon"
      aria-label="Search"
      className={className}
      onClick={openSearch}
    >

{isSmallScreen ? <SearchIcon className="h-5 w-5" />
         : <LongSearch />}


      {/* // <SearchIcon className="h-5 w-5" />
      // <LongSearch /> */}
    </Button>
  );
}
