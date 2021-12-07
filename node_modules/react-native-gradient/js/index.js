// @flow

import * as React from 'react';
import PropTypes from 'prop-types';
import {requireNativeComponent, processColor} from 'react-native';

const NativeView = requireNativeComponent('RNQ42Gradient');

class Gradient extends React.Component<NativeProps> {
  static propTypes = {
    type: PropTypes.string.isRequired,
    colors: PropTypes.arrayOf(PropTypes.string).isRequired,
    locations: PropTypes.arrayOf(PropTypes.number),
    radialRadius: PropTypes.number,
    radialCenter: PropTypes.arrayOf(PropTypes.number),
  };

  static defaultProps = {
    locations: [0.0, 1.0],
  };

  render() {
    const colors = this.props.colors.map(processColor);
    return <NativeView {...this.props} colors={colors} />;
  }
}

type GradientType = 'linear' | 'radial';

type NativeProps = {
  type: GradientType,
  colors: string[],
  locations?: ?(number[]), // iOS only
  radialRadius?: ?number,
  radialCenter?: ?[number, number],
};

type LinearProps = {
  colors: $PropertyType<NativeProps, 'colors'>,
  locations?: $PropertyType<NativeProps, 'locations'>, // iOS only
};

type RadialProps = {
  colors: $PropertyType<NativeProps, 'colors'>,
  locations?: $PropertyType<NativeProps, 'locations'>, // iOS only
  radius: number, // Not optional in case of a radial
  center?: $PropertyType<NativeProps, 'radialCenter'>,
};

export default {
  Linear: (props: LinearProps) => <Gradient {...props} type="linear" />,
  Radial: ({radius, center, ...otherProps}: RadialProps) => (
    <Gradient
      {...otherProps}
      type="radial"
      radialRadius={radius}
      radialCenter={center || [0.5, 0.5]}
    />
  ),
};
