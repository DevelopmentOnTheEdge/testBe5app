import React from 'react';

import {
  staticPage as StaticPage,
  document as Document,
  sideBar as SideBar
} from 'be5-react/dist/lib/scripts/be5/components';

export default React.createClass({displayName: 'TestBe5app',

  render: function() {
    return (
      <div>
        <Document ref="document"/>
        <hr/>
        <SideBar ref="sideBar"/>
      </div>
    );

  },
  
  refresh: function() {
    this.refs.sideBar.refresh();
  }
});
