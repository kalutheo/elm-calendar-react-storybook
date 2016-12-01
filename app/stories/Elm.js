import React from 'react';
export default class Elm extends React.Component{
  handleRef = (ref) => {
    this.ref = ref;
  }
  componentDidMount() {
    if (this.ref) {
      this.props.src.embed(this.ref, this.props.flags);
    }
  }
  render() {
     return <div ref={this.handleRef}></div>
  }
};
