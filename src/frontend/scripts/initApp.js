import ReactDOM     from 'react-dom';
import React        from 'react';
import { Provider } from 'react-redux';
import {Application, be5init, createBaseStore, rootReducer} from 'be5-react';
import './register';


const store = createBaseStore(rootReducer);

const render = Component => {
  ReactDOM.render(
    <AppContainer>
      <Provider store={store}>
        <Component />
      </Provider>
    </AppContainer>,
    document.getElementById('app'),
  )
};

be5init.init(store, function () {
  render(Application);
});

//Webpack Hot Module Replacement API
if (module.hot) {
  module.hot.accept('./components/Application', () => {
    render(Application)
  })
}
