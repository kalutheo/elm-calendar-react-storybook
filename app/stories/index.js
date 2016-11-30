import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import '../src/main.css';
import {Storybook} from '../build/calendar.storybook.js';
import Elm from './Elm.js';

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
  .add('Сентябрь', () => (
    <div id="calendar">
      <Elm src={Storybook.CalendarHeader} flags={'Сентябрь'} />
    </div>
  ))
  .add('Декабрь', () => (
    <div id="calendar">
      <Elm src={Storybook.CalendarHeader} flags={'Декабрь'} />
    </div>
  ))




  storiesOf('Calendar Day', module)
    .add('normal', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'Normal'} />
      </div>
    ))
    .add('selected', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'Selected'} />
      </div>
    ))
    .add('dimmed', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'Dimmed'} />
      </div>
    ))
    .add('hovered', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'Hovered'} />
      </div>
    ))
    .add('disabled', () => (
      <div id="calendar">
        <Elm src={Storybook.CalendarDay} flags={'Disabled'} />
      </div>
    ))
