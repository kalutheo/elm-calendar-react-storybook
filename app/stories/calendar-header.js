import React from 'react';
import { storiesOf } from '@kadira/storybook';
import Elm from './Elm.js';
import CalendarHeaderApp from '../src/Storybook/CalendarHeader.elm';

const CalendarHeader =  CalendarHeaderApp.Main;

storiesOf('Calendar Header', module)
  .add('october', () => (
    <div id="calendar">
      <Elm src={CalendarHeader} flags={'October'} />
    </div>
  ))
  .add('december', () => (
    <div id="calendar">
      <Elm src={CalendarHeader} flags={'December'} />
    </div>
  ))
  .add('january', () => (
    <div id="calendar">
      <Elm src={CalendarHeader} flags={'january'} />
    </div>
  ))
  .add('Сентябрь', () => (
    <div id="calendar">
      <Elm src={CalendarHeader} flags={'Сентябрь'} />
    </div>
  ))
  .add('Декабрь', () => (
    <div id="calendar">
      <Elm src={CalendarHeader} flags={'Декабрь'} />
    </div>
  ))
