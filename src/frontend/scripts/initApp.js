import ReactDOM from 'react-dom';
import React    from 'react';
import {be5} from 'be5-react';
import TestBe5app      from './components/testBe5app';
import '../sass/styles.scss'

ReactDOM.render(
  <TestBe5app />,
  document.getElementById('app')
);

be5.net.request('languageSelector', {}, function(data) {
  be5.locale.set(data.selected, data.messages);
  be5.url.process(document.location.hash);
});
