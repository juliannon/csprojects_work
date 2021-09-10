/* global monogatari */

// Define the messages used in the game.
monogatari.action ('message').messages ({
	'Help': {
		title: 'Help',
		subtitle: 'Some useful Links',
		body: `
			<p><a href='https://developers.monogatari.io/documentation/'>Documentation</a> - Everything you need to know.</p>
			<p><a href='https://monogatari.io/demo/'>Demo</a> - A simple Demo.</p>
		`
	}
});

// Define the notifications used in the game
monogatari.action ('notification').notifications ({
	'Welcome': {
		title: 'Welcome',
		body: 'This is the Monogatari VN Engine',
		icon: ''
	}
});

// Define the Particles JS Configurations used in the game
monogatari.action ('particles').particles ({

});

// Define the canvas objects used in the game
monogatari.action ('canvas').objects ({

});

// Credits of the people involved in the creation of this awesome game
monogatari.configuration ('credits', {
    '' : {
        project: '<a href="https://github.com/dkessner/visual_novel_template" target="_blank">https://github.com/dkessner/visual_novel_template</a>',
        'Monogatari visual novel engine': '<a href="https://monogatari.io/" target="_blank">https://monogatari.io</a>'
    }
});


// Define the images that will be available on your game's image gallery
monogatari.assets ('gallery', {

});

// Define the music used in the game.
monogatari.assets ('music', {

});

// Define the voice files used in the game.
monogatari.assets ('voices', {

});

// Define the sounds used in the game.
monogatari.assets ('sounds', {

});

// Define the videos used in the game.
monogatari.assets ('videos', {

});

// Define the images used in the game.
monogatari.assets ('images', {
    alpaca: "alpaca.jpg",
    tower: "tower.jpg",
		ship: "ship.jpg",
		space: "space.jpg"
});

// Define the backgrounds for each scene.
monogatari.assets ('scenes', {

});


// Define the Characters
monogatari.characters ({

});


monogatari.script ({

	'Start': [
            'show image alpaca with fadeIn',
            'This is Fred.',
            'And this is the story of Fred :D',
            'hide image alpaca with fadeOut',
            'jump Next'
        ],

        'Next': [
            'show image tower with fadeIn',
            'Fred stole some cranes from the humans and began to build for the missions.',
            'hide image tower with fadeOut',
            'jump Next0'
				],

				'Next0': [
					'show image ship with fadeIn',
					'To complete the mission, the humans turned the tower into a spacecraft.',
					'hide image ship with fadeOut',
					'jump Next1'
				],

				'Next1': [
					'show image space with fadeIn',
					'Fred wanted to fly beyond the stars.',
					'hide image space with fadeOut',
					'end'
				]
});


monogatari.component ('main-screen').template (() => {
    return `
        <h1>The Story of F R E D</h1>
        <br/>
        <p>
        hi i am fred
        </p>
        <br/>
        <center>
        <img src="assets/images/alpaca.jpg" height="50%"/>
        </center>

        <main-menu></main-menu>
    `;
});
