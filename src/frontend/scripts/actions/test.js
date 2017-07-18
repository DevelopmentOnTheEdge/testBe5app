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

//Can be lazy
//import React          from 'react';
//import changeDocument from '../core/changeDocument';
//import load           from 'bundle-loader?lazy!../services/tables';
//
//export default function(entity, query, params) {
//
//  load((Tables) => {
//    Tables.default.load({ entity: entity, query: query || 'All records', params: params, options: { embedded: false } }, changeDocument);
//  });
//
//};
