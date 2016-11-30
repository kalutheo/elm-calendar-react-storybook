import React from 'react';
import { storiesOf, action } from '@kadira/storybook';
import {Storybook} from '../build/calendar.storybook.js';
import Elm from './Elm.js';
import CalendarHeaderApp from '../src/Storybook/CalendarHeader.elm';
import CalendarDayApp from '../src/Storybook/CalendarDay.elm';

import '../src/main.css';


// -- HEADER
const CalendarHeader = CalendarHeaderApp.Storybook.CalendarHeader;
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


// --- DAY

const CalendarDay = CalendarDayApp.Storybook.CalendarDay;

storiesOf('Calendar Day', module)
  .add('normal', () => (
    <div id="calendar">
      <Elm src={CalendarDay} flags={'Normal'} />
    </div>
  ))
  .add('selected', () => (
    <div id="calendar">
      <Elm src={CalendarDay} flags={'Selected'} />
    </div>
  ))
  .add('dimmed', () => (
    <div id="calendar">
      <Elm src={CalendarDay} flags={'Dimmed'} />
    </div>
  ))
  .add('hovered', () => (
    <div id="calendar">
      <Elm src={CalendarDay} flags={'Hovered'} />
    </div>
  ))
  .add('disabled', () => (
    <div id="calendar">
      <Elm src={CalendarDay} flags={'Disabled'} />
    </div>
  ))
