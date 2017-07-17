import ReactDOM from 'react-dom';
import React    from 'react';
import TestBe5app      from './components/testBe5app';

//import be5 from 'be5-react/dist/lib/scripts/be5/be5';
import {be5} from 'be5-react';

ReactDOM.render(
  <TestBe5app />,
  document.getElementById('app')
);

be5.net.request('languageSelector', {}, function(data) {
  be5.locale.set(data.selected, data.messages);
  be5.url.process(document.location.hash);
});


//
//ReactDOM.render((
//    <Document />
//), document.getElementById('app'));
////initialize('app', App);