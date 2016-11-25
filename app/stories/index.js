import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import '../src/main.css';
import {Storybook} from '../build/calendar.storybook.js';

const Elm = React.createClass({
  handleRef(ref) {
    this.ref = ref;
  },
  componentDidMount() {
    if (this.ref) {
      this.props.src.embed(this.ref, this.props.flags);
    }
  },
	render: function () {
		return <div ref={this.handleRef}></div>
	}
});

storiesOf('Calendar Header', module)
  .add('october', () => (
    <div id="calendar">
      <Elm src={Storybook.CalendarHeader} flags={'October'} />
    </div>
  ))
  .add('december', () => (
    <div id="calendar">
      <Elm src={Storybook.CalendarHeader} flags={'December'} />
    </div>
  ))
  .add('january', () => (
    <div id="calendar">
      <Elm src={Storybook.CalendarHeader} flags={'january'} />
    </div>
  ))


  storiesOf('Calendar Day', module)
    .add('october', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'October'} />
      </div>
    ))
    .add('december', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'December'} />
      </div>
    ))
    .add('january', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'january'} />
      </div>
    ))
