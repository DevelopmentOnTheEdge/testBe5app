import ReactDOM from 'react-dom';
import React    from 'react';
import {be5} from 'be5-react';
import TestBe5app      from './components/testBe5app';
import TestAction      from './actions/test';
import '../sass/styles.scss'

be5.net.request('languageSelector', {}, function(data) {
  be5.locale.set(data.selected, data.messages);
  be5.url.process(document.location.hash);
});

be5.registerAction('test', TestAction);

ReactDOM.render(
  <TestBe5app />,
  document.getElementById('app')
);
