import React from 'react';
import ReactDOM from 'react-dom';

const Square = (props) => {
  return (
    <button className="square" onClick={props.onClick}>{props.value}</button>
  );
}

export default Square;
