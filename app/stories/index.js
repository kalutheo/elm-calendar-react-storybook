import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import '../src/main.css';
import {Storybook} from '../build/storybook.calendar-header.js';

const Elm = React.createClass({
  componentDidMount() {
    console.log('componentDidMount');
    const node = this.refs.component;
		var app = this.props.src.embed(node, this.props.flags);
		if (typeof this.props.ports !== 'undefined') {
			this.props.ports(app.ports);
		}
  },
	shouldComponentUpdate: function(prevProps) {
		return false;
	},
	render: function () {
		return <div ref='component'></div>
	}
});

storiesOf('Calendar Header', module)
  .add('october', () => (
    <div id="calendar">
      <Elm src={Storybook.CalenderHeader} flags={'October'} ports={()=>{}}/>
    </div>
  ))
  .add('december', () => (
    <div id="calendar">
      <Elm src={Storybook.CalenderHeader} flags={'December'} ports={()=>{}}/>
    </div>
  ))
  .add('january', () => (
    <div id="calendar">
      <Elm src={Storybook.CalenderHeader} flags={'january'} ports={()=>{}}/>
    </div>
  ))
