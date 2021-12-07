interface LinearProps {
  colors: string[],
  locations?: ?number[], // iOS only
}

interface RadialProps {
  colors: string[],
  locations?: ?number[], // iOS only
  radius: number, // Not optional in case of a radial
  center?: ?[number, number],
}

declare namespace Gradient {
  function Linear(props: LinearProps): JSX.Element;
  function Radial(props: RadialProps): JSX.Element;
};

export default Gradient;
