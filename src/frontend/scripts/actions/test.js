import React          from 'react';
import {
  be5,
  changeDocument
} from 'be5-react';

import TestPage from '../components/testPage';

export default function(page) {

//  be5.net.request('static/' + page, {}, data => {
//
//  });
  changeDocument({ component: TestPage, value: {} })

};
