import ReactDOM from 'react-dom';
import React    from 'react';
import {Application, be5init} from 'be5-react';
import './register';


ReactDOM.render(
  <Application />,
  document.getElementById('app')
);
be5init.init();