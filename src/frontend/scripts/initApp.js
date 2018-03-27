import ReactDOM     from 'react-dom';
import React        from 'react';
import { Provider } from 'react-redux';
import {Application, be5init, createBaseStore, rootReducer} from 'be5-react';
import './register';


const store = createBaseStore(rootReducer);
be5init.init(store);

ReactDOM.render(
  <Provider store={store}>
    <Application/>
  </Provider>,
  document.getElementById('app')
);