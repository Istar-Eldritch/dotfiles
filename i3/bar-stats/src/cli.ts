#!/bin/node
import {reduce} from 'bluebird';


import docker from './docker';
import network from './network';
import audio_out from './audio-out';
import audio_in from './audio-in';
import battery from './battery';
import time from './time';

setInterval(async () => {
  const toPrint = await reduce([docker(), network(), audio_in(), audio_out(),battery(), time()], (acc, stat, i) => {
    if(stat) {
      return acc + (i ? ' : ' : '') + stat
    }
    return acc;
  }, '');

  console.log(toPrint);
}, 1000)