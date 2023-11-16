import React from 'react';
import styled from 'styled-components';
import { SearchIcon } from '@/components/icons/search-icon';

const LongSearchBox = styled.div`
  display: flex;
  align-items: center;
  border: 1px solid #ff7034;
  border-radius: 5px;
  padding: 3px;
  width: 700px; /* Default width for larger screens */
  max-width: 100%; /* Ensures the search box doesn't exceed the container's width */
  box-sizing: border-box; /* Prevents padding from increasing the width */
  margin-right: 100px;
  margin-left: 100px;
  overflow: hidden;
  @media (max-width: 1180px) {
    width: 90%; /* Decrease width on smaller screens */
  }
`;

const SearchInput = styled.input`
  flex: 1;
  border: none;
  outline: none;
//   margin-left: 2px;
  
`;

const LongSearch = () => {
  return (
    <LongSearchBox>
      <SearchIcon className="h-5 w-5" />
      <SearchInput type="text" placeholder="Search..." />
    </LongSearchBox>
  );
};

export default LongSearch;
