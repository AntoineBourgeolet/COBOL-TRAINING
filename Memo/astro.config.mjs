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
						
						{ label: 'Compilation', slug: 'fondamentaux/compilation' },
					],
				},
				{
					label: 'Instructions / Fonctions',
					items: [
						{ label: 'Instructions simples', slug: 'instructions/simples' },
						{ label: 'Fonctions intrinseques', slug: 'instructions/fonctions-intrinseques' },
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
