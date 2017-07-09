import React from 'react';
import {bus, SideBar, document} from 'be5-react';
//import {table} from 'be5-react';
//import {bus, SideBar, document} from 'be5-react';
//import SplitPane from 'be5-react';
//
export default React.createClass({
  displayName: 'TestBe5app',
  
//  componentDidMount: function() {
//    bus.listen('LoggedOut', this.refresh);
//    bus.listen('LoggedIn', this.refresh);
//    bus.listen('LanguageChanged', this.refresh);
//    bus.listen('RoleChanged', this.refresh);
//  },
//
  render: function() {
    return (
      <div>
        <h1>App frontend</h1>
        <SideBar ref="sideBar"/>

      </div>
    );
//<Document ref="document"/>
  },
  
  refresh: function() {
    this.refs.sideBar.refresh();
  }
});
