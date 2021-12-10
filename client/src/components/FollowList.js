import React from 'react'

export default function FollowList() {

    const randomLocation = () => {
        return {
            x: Math.random() * window.innerWidth - window.innerWidth / 2 + 'px',
            y: Math.random() * window.innerHeight - window.innerHeight / 2 + 'px'
        };
    };

    const randomColor = () => {
        return `hsl(${Math.floor(Math.random() * 361)}, 100%, 50%)`;
    };

    const pyro = () => {
        const btn = document.getElementById('fireworks');
        const particles = [];
        const color = randomColor();

        const particle = document.createElement('span');
        particle.classList.add('particle', 'move');

        const { x, y } = randomLocation();
        particle.style.setProperty('--x', x);
        particle.style.setProperty('--y', y);
        particle.style.background = color;
        btn.style.background = color;
        btn.appendChild(particle);
        particles.push(particle);

        setTimeout(() => {

            for (let i = 0; i < 100; i++) { const innerP=document.createElement('span'); innerP.classList.add('particle', 'move' ); innerP.style.transform=`translate(${x}, ${y})`; const xs=Math.random() * 200 - 100 + 'px' ; const ys=Math.random() * 200 - 100 + 'px' ; innerP.style.setProperty('--x', `calc(${x} + ${xs})`); innerP.style.setProperty('--y', `calc(${y} + ${ys})`); innerP.style.animationDuration=Math.random() * 300 + 200 + 'ms' ; innerP.style.background=color; btn.appendChild(innerP); particles.push(innerP); } setTimeout(()=> {
                particles.forEach(particle => {
                particle.remove();
                });
                }, 1000);
                }, 1000);
    };

    return (
        <div className='container-fluid mt-5'>
            <div className='row'>
            <div className='col-6'>
            <div className='card border-dark m-3'>
                <h3>Followers</h3>
                <ul>
                    <li>Followers</li>
                    <li>Followers</li>
                    <li>Followers</li>
                    <li>Followers</li>
                    <li>Followers</li>
                    <li>Followers</li>
                </ul>
            </div>
            </div>
            <div className='col-6'>
            <div className='card border-dark m-3'>
                <h3>Following</h3>
                <ul>
                    <li>Followed</li>
                    <li>Followed</li>
                    <li>Followed</li>
                    <li>Followed</li>
                    <li>Followed</li>
                    <li>Followed</li>
                </ul>
            </div>
            </div>

            </div>

            <div className='text-center'>
                <button id="fireworks" onClick={pyro}>
                    Surprise!
                </button>
                <br />
                <img className='construction-image' src='https://i.imgur.com/F5zprnm.png' alt='Under construction' />
            </div>

            
        </div>
    )
}
