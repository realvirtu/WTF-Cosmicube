function onCreatePost()
{
	onSectionHit();
}

function onSectionHit()
{
	var suffix:String = (mustHitSection ? '-right' : '');

	if (parent.idleSuffix != suffix)
    {
        parent.playAnim('turn' + suffix, true);
        parent.idleSuffix = suffix;
        parent.recalculateDanceIdle();
        parent.danced = false;
    }
}
