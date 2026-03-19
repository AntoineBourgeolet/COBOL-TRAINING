// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	integrations: [
		starlight({
			title: 'Memo COBOL',
			sidebar: [
				{
					label: 'Fondamentaux',
					items: [
						{ label: 'Vue d\'ensemble', slug: 'fondamentaux/apercu' },
						{ label: 'Structure du programme', slug: 'fondamentaux/structure-programme' },
						{ label: 'Types de donnees', slug: 'fondamentaux/types-donnees' },
						{ label: 'Gestion des fichiers', slug: 'fondamentaux/gestion-fichiers' },
						{ label: 'Entree / sortie', slug: 'fondamentaux/entree-sortie' },
						{ label: 'Fonctions intrinseques', slug: 'fondamentaux/fonctions-intrinseques' },
						{ label: 'Compilation', slug: 'fondamentaux/compilation' },
					],
				},
				{
					label: 'Instructions',
					items: [
						{ label: 'Instructions simples', slug: 'instructions/simples' },
						{ label: 'Instructions utiles', slug: 'instructions/utiles' },
					],
				},
				{
					label: 'Travaux pratiques',
					autogenerate: { directory: 'tp' },
				},
			],
		}),
	],
});
