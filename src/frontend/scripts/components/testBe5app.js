import React from 'react';

import {
  StaticPage,
  Document,
  SideBar
} from 'be5-react';

export default React.createClass({displayName: 'TestBe5app',

  render: function() {
    return (
      <div className="container">

        <div className="row">
          <div className="col-md-12">
            <br/><h1>Header</h1><br/><br/>
          </div>
          <div className="col-md-3">
            <SideBar ref="sideBar"/>
          </div>
          <div className="col-md-9">
            <Document ref="document"/>
          </div>
        </div>
      </div>
    );

  },
  
  refresh: function() {
    this.refs.sideBar.refresh();
  }
});
