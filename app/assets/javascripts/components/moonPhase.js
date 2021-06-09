import newMoon from '../assets/newMoon.png';
import waxingCrescent from '../assets/waxingCrescent.png';
import firstQuarter from '../assets/firstQuarter.png';
import waxingGibbous from '../assets/waxingGibbous.png';
import fullMoon from '../assets/fullMoon.png';
import waningGibbous from '../assets/waningGibbous.png';
import lastQuarter from '../assets/lastQuarter.png';
import waningCrescent from '../assets/waningCrescent.png';

const images = {
  newMoon,
  waxingCrescent,
  firstQuarter,
  waxingGibbous,
  fullMoon,
  waningGibbous,
  lastQuarter,
  waningCrescent
}

function MoonCard (props) {
  const { moonPhase } = props;

  return (
        <div className='moon__image'
          style={{ backgroundImage:`url(${images[moonPhase]})` }}>
        </div>
      {props.children}
    </div>
  )
}

export default MoonCard;
