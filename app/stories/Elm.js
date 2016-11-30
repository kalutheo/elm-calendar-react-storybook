import React from 'react';
export default class Elm extends React.Component{
  handleRef = (ref) => {
    this.ref = ref;
  }
  componentDidMount() {
    this.props.src.embed(this.ref, this.props.flags);
  }
	render() {
		return <div ref={this.handleRef}></div>
	}
};
