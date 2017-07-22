import ReactDOM from 'react-dom';
import React    from 'react';
import {be5} from 'be5-react';
import TestBe5app      from './components/testBe5app';
import TestAction      from './actions/test';

import 'react-datetime/css/react-datetime.css';
import 'react-select/dist/react-select.css';
import '../sass/styles.scss';


be5.registerAction('test', TestAction);

ReactDOM.render(
  <TestBe5app />,
  document.getElementById('app')
);
