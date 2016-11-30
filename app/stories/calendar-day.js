import React from 'react';
import { storiesOf } from '@kadira/storybook';
import Elm from './Elm.js';
import CalendarDayApp from '../src/Storybook/CalendarDay.elm';

const CalendarDay = CalendarDayApp.Main;

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
